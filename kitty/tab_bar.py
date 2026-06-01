import datetime
import unicodedata

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_tab_with_powerline,
)

timer_id = None


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global timer_id

    if timer_id is None:
        timer_id = add_timer(_redraw_tab_bar, 2.0, True)
    if max_title_length > 0:
        tab = tab._replace(title=_truncate_text(tab.title, max_title_length))
    draw_tab_with_powerline(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )

    if is_last:
        draw_right_status(draw_data, screen)
    return screen.cursor.x


def _display_width(text: str) -> int:
    width = 0
    for ch in text:
        if unicodedata.east_asian_width(ch) in "FW":
            width += 2
        else:
            width += 1
    return width


def _truncate_text(text: str, max_width: int) -> str:
    """截断文本到指定显示宽度，超长时加省略号"""
    if _display_width(text) <= max_width:
        return text

    result = []
    current_width = 0
    ellipsis_width = _display_width("…")
    max_content_width = max(0, max_width - ellipsis_width)

    for ch in text:
        ch_width = 2 if unicodedata.east_asian_width(ch) in "FW" else 1
        if current_width + ch_width > max_content_width:
            break
        result.append(ch)
        current_width += ch_width

    return "".join(result) + "…"


def draw_right_status(draw_data: DrawData, screen: Screen) -> None:
    draw_attributed_string(Formatter.reset, screen)
    cells = create_cells()

    while True:
        if not cells:
            return
        padding = screen.columns - screen.cursor.x - sum(_display_width(c) + 3 for c in cells)
        if padding >= 0:
            break
        cells = cells[1:]

    if padding:
        screen.draw(" " * padding)

    tab_bg = as_rgb(int(draw_data.inactive_bg))
    tab_fg = as_rgb(int(draw_data.inactive_fg))
    default_bg = as_rgb(int(draw_data.default_bg))

    for cell in cells:
        if cell == cells[0]:
            screen.cursor.fg = tab_bg
            screen.draw("")
        else:
            screen.cursor.fg = default_bg
            screen.cursor.bg = tab_bg
            screen.draw("")
        screen.cursor.fg = tab_fg
        screen.cursor.bg = tab_bg
        screen.draw(f" {cell} ")


def create_cells() -> list[str]:
    now = datetime.datetime.now()
    return [
        now.strftime("%d %b"),
        now.strftime("%H:%M"),
    ]


def _redraw_tab_bar(timer_id):
    for tm in get_boss().all_tab_managers:
        tm.mark_tab_bar_dirty()

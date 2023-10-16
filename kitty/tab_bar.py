# import json
# import subprocess
# from collections import defaultdict
# from datetime import datetime, timezone
#
# from kitty.boss import get_boss
# from kitty.fast_data_types import Screen, add_timer
# from kitty.rgb import Color
# from kitty.tab_bar import (
#     DrawData,
#     ExtraData,
#     Formatter,
#     TabBarData,
#     as_rgb,
#     draw_attributed_string,
#     draw_title,
# )
# from kitty.utils import color_as_int
#
# timer_id = None
#
# ICON = "  "
# RIGHT_MARGIN = 1
# REFRESH_TIME = 15
#
# icon_fg = as_rgb(color_as_int(Color(255, 250, 205)))
# icon_bg = as_rgb(color_as_int(Color(47, 61, 68)))
# # OR icon_bg = as_rgb(0x2f3d44)
# bat_text_color = as_rgb(0x999F93)
# clock_color = as_rgb(0x7FBBB3)
# dnd_color = as_rgb(0x465258)
# sep_color = as_rgb(0x999F93)
# utc_color = as_rgb(color_as_int(Color(113, 115, 116)))
#
#
# # cells = [
# #     (Color(113, 115, 116), dnd),
# #     (Color(135, 192, 149), clock),
# #     (Color(113, 115, 116), utc),
# # ]
#
#
# def calc_draw_spaces(*args) -> int:
#     length = 0
#     for i in args:
#         if not isinstance(i, str):
#             i = str(i)
#         length += len(i)
#     return length
#
#
# def _draw_icon(screen: Screen, index: int) -> int:
#     if index != 1:
#         return 0
#
#     fg, bg = screen.cursor.fg, screen.cursor.bg
#     screen.cursor.fg = icon_fg
#     screen.cursor.bg = icon_bg
#     screen.draw(ICON)
#     screen.cursor.fg, screen.cursor.bg = fg, bg
#     screen.cursor.x = len(ICON)
#     return screen.cursor.x
#
#
# def _draw_left_status(
#     draw_data: DrawData,
#     screen: Screen,
#     tab: TabBarData,
#     before: int,
#     max_title_length: int,
#     index: int,
#     is_last: bool,
#     extra_data: ExtraData,
# ) -> int:
#     # print(extra_data)
#     if draw_data.leading_spaces:
#         screen.draw(" " * draw_data.leading_spaces)
#
#     # TODO: https://github.com/kovidgoyal/kitty/discussions/4447#discussioncomment-2463083
#     # tm = get_boss().active_tab_manager
#     #     if tm is not None:
#     #         w = tm.active_window
#     #         if w is not None:
#     #             cwd = w.cwd_of_child or ''
#     #             log_error(cwd)
#
#     draw_title(draw_data, screen, tab, index)
#     trailing_spaces = min(max_title_length - 1, draw_data.trailing_spaces)
#     max_title_length -= trailing_spaces
#     extra = screen.cursor.x - before - max_title_length
#     if extra > 0:
#         screen.cursor.x -= extra + 1
#         screen.draw("…")
#     if trailing_spaces:
#         screen.draw(" " * trailing_spaces)
#     end = screen.cursor.x
#     screen.cursor.bold = screen.cursor.italic = False
#     screen.cursor.fg = 0
#     if not is_last:
#         screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
#         screen.draw(draw_data.sep)
#     screen.cursor.bg = 0
#     return end
#
#
# def _get_dnd_status():
#     result = subprocess.run("~/.dotfiles/bin/dnd -k",
#                             shell=True, capture_output=True)
#     status = ""
#
#     if result.stderr:
#         raise subprocess.CalledProcessError(
#             returncode=result.returncode, cmd=result.args, stderr=result.stderr
#         )
#
#     if result.stdout:
#         status = result.stdout.decode("utf-8").strip()
#
#     return status
#
#
# # more handy kitty tab_bar things:
# # REF: https://github.com/kovidgoyal/kitty/discussions/4447#discussioncomment-2183440
# def _draw_right_status(screen: Screen, is_last: bool) -> int:
#     if not is_last:
#         return 0
#     # global timer_id
#     # if timer_id is None:
#     #     timer_id = add_timer(_redraw_tab_bar, REFRESH_TIME, True)
#
#     draw_attributed_string(Formatter.reset, screen)
#
#     clock = datetime.now().strftime("%H:%M")
#     utc = datetime.now(timezone.utc).strftime(" (UTC %H:%M)")
#     dnd = _get_dnd_status()
#
#     cells = []
#     if dnd != "":
#         cells.append((dnd_color, dnd))
#         cells.append((sep_color, " ⋮ "))
#
#     cells.append((clock_color, clock))
#     cells.append((utc_color, utc))
#
#     # right_status_length = calc_draw_spaces(dnd + " " + clock + " " + utc)
#
#     right_status_length = RIGHT_MARGIN
#     for cell in cells:
#         right_status_length += len(str(cell[1]))
#
#     draw_spaces = screen.columns - screen.cursor.x - right_status_length
#
#     if draw_spaces > 0:
#         screen.draw(" " * draw_spaces)
#
#     screen.cursor.fg = 0
#     for color, status in cells:
#         screen.cursor.fg = color  # as_rgb(color_as_int(color))
#         screen.draw(status)
#     screen.cursor.bg = 0
#
#     if screen.columns - screen.cursor.x > right_status_length:
#         screen.cursor.x = screen.columns - right_status_length
#
#     return screen.cursor.x
#
#
# # REF: https://github.com/kovidgoyal/kitty/discussions/4447#discussioncomment-1940795
# # def _redraw_tab_bar():
# #     tm = get_boss().active_tab_manager
# #     if tm is not None:
# #         tm.mark_tab_bar_dirty()
#
#
# def draw_tab(
#     draw_data: DrawData,
#     screen: Screen,
#     tab: TabBarData,
#     before: int,
#     max_title_length: int,
#     index: int,
#     is_last: bool,
#     extra_data: ExtraData,
# ) -> int:
#
#     _draw_icon(screen, index)
#     _draw_left_status(
#         draw_data,
#         screen,
#         tab,
#         before,
#         max_title_length,
#         index,
#         is_last,
#         extra_data,
#     )
#     _draw_right_status(
#         screen,
#         is_last,
#     )
#
#     return screen.cursor.x
#

import datetime
import json
import subprocess
from collections import defaultdict

from kitty.rgb import Color
from kitty.boss import get_boss
from kitty.fast_data_types import Screen
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_tab_with_powerline,
    draw_title
)
from kitty.utils import color_as_int

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

    # if timer_id is None:
    #     timer_id = add_timer(_redraw_tab_bar, 2.0, True)
    draw_tab_with_powerline(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )

    if is_last:
        draw_right_status(draw_data, screen)
    return screen.cursor.x


def draw_right_status(draw_data: DrawData, screen: Screen) -> None:
    # The tabs may have left some formats enabled. Disable them now.
    draw_attributed_string(Formatter.reset, screen)
    cells = create_cells()
    # Drop cells that wont fit
    while True:
        if not cells:
            return
        padding = screen.columns - screen.cursor.x - \
            sum(len(c) + 3 for c in cells)
        if padding >= 0:
            break
        cells = cells[1:]

    if padding:
        screen.draw(" " * padding)

    tab_bg = as_rgb(int(draw_data.inactive_bg))
    tab_fg = as_rgb(int(draw_data.inactive_fg))
    default_bg = as_rgb(int(draw_data.default_bg))
    for cell in cells:
        # Draw the separator
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
        # currently_playing(),
        # get_headphone_battery_status(),
        now.strftime("%d %b"),
        now.strftime("%H:%M"),
    ]


def get_headphone_battery_status():
    try:
        battery_pct = int(subprocess.getoutput("headsetcontrol -b -c"))
    except Exception:
        status = ""
    else:
        if battery_pct < 0:
            status = ""
        else:
            status = f"{battery_pct}% {''[battery_pct // 10]}"
    return f" {status}"


STATE = defaultdict(lambda: "", {"Paused": "", "Playing": ""})


def currently_playing():
    # TODO: Work out how to add python libraries so that I can query dbus directly
    # For now, implemented in a separate python project: dbus-player-status
    status = " "
    data = {}
    try:
        data = json.loads(subprocess.getoutput("dbus-player-status"))
    except ValueError:
        pass
    if data:
        if "state" in data:
            status = f"{status} {STATE[data['state']]}"
        if "title" in data:
            status = f"{status} {data['title']}"
        if "artist" in data:
            status = f"{status} - {data['artist']}"
    else:
        status = ""
    return status


def _redraw_tab_bar(timer_id):
    for tm in get_boss().all_tab_managers:
        tm.mark_tab_bar_dirty()

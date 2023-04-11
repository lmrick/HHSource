package
{
   import com.sulake.bootstrap.HabboWindowManagerComponentBootstrap;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.iid.IIDCoreWindowManager;
   import com.sulake.iid.IIDHabboWindowManager;
   import mx.core.SimpleApplication;
   

   public class HabboWindowManagerCom extends SimpleApplication
   {
      
      public static var requiredClasses:Array = new Array(HabboWindowManagerComponentBootstrap,IIDHabboWindowManager,IIDCoreWindowManager,HabboWindowManagerComponent,ICoreLocalizationFrameworkLib,ICoreWindowFrameworkLib,CoreWindowFrameworkLib);
      
      public static var manifest:Class = manifest;
      
      public static var habbo_element_description_xml:Class = habbo_element_description;
      
      public static var habbo_window_layout_alert_xml:Class = alert;
      
      public static var habbo_window_layout_bubble_xml:Class = bubble;
      
      public static var habbo_window_layout_bubble_7_xml:Class = class_1816;
      
      public static var habbo_window_layout_button_xml:Class = button;
      
      public static var habbo_window_layout_button_thick_xml:Class = button_thick;
      
      public static var habbo_window_layout_button_black_xml:Class = class_1858;
      
      public static var habbo_window_layout_button_thick_black_xml:Class = class_1868;
      
      public static var habbo_window_layout_button_shiny_xml:Class = class_1866;
      
      public static var habbo_window_layout_button_shiny_thick_xml:Class = button_shiny_thick;
      
      public static var habbo_window_layout_button_shiny_large_xml:Class = class_1864;
      
      public static var habbo_window_layout_button_shiny_large_5_xml:Class = button_shiny_large_5;
      
      public static var habbo_window_layout_button_shiny_black_xml:Class = class_1863;
      
      public static var habbo_window_layout_button_shiny_thick_black_xml:Class = class_1865;
      
      public static var habbo_window_layout_dropmenu_xml:Class = class_2045;
      
      public static var habbo_window_layout_dropmenu_3_xml:Class = class_2042;
      
      public static var habbo_window_layout_dropmenu_black_xml:Class = dropmenu_black;
      
      public static var habbo_window_layout_dropmenu_item_xml:Class = dropmenu_item;
      
      public static var habbo_window_layout_dropmenu_item_3_xml:Class = class_2043;
      
      public static var habbo_window_layout_dropmenu_item_black_xml:Class = class_2044;
      
      public static var habbo_window_layout_droplist_xml:Class = droplist;
      
      public static var habbo_window_layout_frame_xml:Class = class_2106;
      
      public static var habbo_window_layout_frame_3_xml:Class = class_2104;
      
      public static var habbo_window_layout_frame_7_xml:Class = class_2105;
      
      public static var habbo_window_layout_header_xml:Class = class_2428;
      
      public static var habbo_window_layout_header_black_xml:Class = class_2427;
      
      public static var habbo_window_layout_header_3_xml:Class = header_3;
      
      public static var habbo_window_layout_header_7_xml:Class = header_7;
      
      public static var habbo_window_layout_scaler_xml:Class = class_2832;
      
      public static var habbo_window_layout_scaler_3_xml:Class = scaler_3;
      
      public static var habbo_window_layout_scrollbar_horizontal_xml:Class = scrollbar_horizontal;
      
      public static var habbo_window_layout_scrollbar_vertical_xml:Class = scrollbar_vertical;
      
      public static var habbo_window_layout_scrollable_itemlist_vertical_xml:Class = scrollable_itemlist_vertical;
      
      public static var habbo_window_layout_scrollable_itemgrid_vertical_xml:Class = scrollable_itemgrid_vertical;
      
      public static var habbo_window_layout_scrollable_itemlist_vertical_ubuntu_xml:Class = scrollable_itemlist_vertical_ubuntu;
      
      public static var habbo_window_layout_scrollable_itemgrid_vertical_ubuntu_xml:Class = class_2836;
      
      public static var habbo_window_layout_simple_xml:Class = class_2884;
      
      public static var habbo_window_layout_tab_button_xml:Class = tab_button;
      
      public static var habbo_window_layout_tab_button_black_xml:Class = class_2965;
      
      public static var habbo_window_layout_tab_button_3_xml:Class = class_2964;
      
      public static var habbo_window_layout_tab_context_xml:Class = tab_context;
      
      public static var habbo_window_layout_tab_context_3_xml:Class = class_2967;
      
      public static var habbo_window_layout_tooltip_xml:Class = tooltip;
      
      public static var habbo_skin_frame_xml:Class = habbo_skin_frame;
      
      public static var habbo_skin_frame_3_xml:Class = class_2401;
      
      public static var habbo_skin_frame_7_xml:Class = class_2402;
      
      public static var habbo_skin_bubble_xml:Class = habbo_skin_bubble;
      
      public static var habbo_skin_bubble_pointer_up_xml:Class = habbo_skin_bubble_pointer_up;
      
      public static var habbo_skin_bubble_pointer_right_xml:Class = habbo_skin_bubble_pointer_right;
      
      public static var habbo_skin_bubble_pointer_down_xml:Class = class_2380;
      
      public static var habbo_skin_frame_pointer_down_xml:Class = habbo_skin_frame_pointer_down;
      
      public static var habbo_skin_bubble_pointer_left_xml:Class = class_2382;
      
      public static var habbo_skin_bubble_7_xml:Class = class_2378;
      
      public static var habbo_skin_bubble_pointer_up_7_xml:Class = class_2384;
      
      public static var habbo_skin_bubble_pointer_right_7_xml:Class = class_2383;
      
      public static var habbo_skin_bubble_pointer_down_7_xml:Class = class_2379;
      
      public static var habbo_skin_bubble_pointer_left_7_xml:Class = class_2381;
      
      public static var habbo_skin_button_default_xml:Class = habbo_skin_button_default;
      
      public static var habbo_skin_button_default_black_xml:Class = habbo_skin_button_default_black;
      
      public static var habbo_skin_button_default_white_xml:Class = class_2387;
      
      public static var habbo_skin_button_shiny_default_xml:Class = habbo_skin_button_shiny_default;
      
      public static var habbo_skin_button_shiny_black_xml:Class = class_2394;
      
      public static var habbo_skin_button_shiny_thick_xml:Class = habbo_skin_button_shiny_thick;
      
      public static var habbo_skin_button_shiny_large_xml:Class = class_2395;
      
      public static var habbo_skin_button_shiny_thick_black_xml:Class = class_2396;
      
      public static var habbo_skin_button_thick_xml:Class = habbo_skin_button_thick;
      
      public static var habbo_skin_button_thick_black_xml:Class = class_2398;
      
      public static var habbo_skin_button_thick_white_xml:Class = class_2399;
      
      public static var habbo_skin_button_group_left_xml:Class = habbo_skin_button_group_left;
      
      public static var habbo_skin_button_group_left_black_xml:Class = class_2390;
      
      public static var habbo_skin_button_group_left_white_xml:Class = habbo_skin_button_group_left_white;
      
      public static var habbo_skin_button_group_center_xml:Class = class_2389;
      
      public static var habbo_skin_button_group_center_black_xml:Class = class_2388;
      
      public static var habbo_skin_button_group_center_white_xml:Class = habbo_skin_button_group_center_white;
      
      public static var habbo_skin_button_group_right_xml:Class = habbo_skin_button_group_right;
      
      public static var habbo_skin_button_group_right_black_xml:Class = habbo_skin_button_group_right_black;
      
      public static var habbo_skin_button_group_right_white_xml:Class = habbo_skin_button_group_right_white;
      
      public static var habbo_skin_button_checkbox_xml:Class = habbo_skin_button_checkbox;
      
      public static var habbo_skin_button_checkbox_black_xml:Class = habbo_skin_button_checkbox_black;
      
      public static var habbo_skin_button_checkbox_white_xml:Class = class_2385;
      
      public static var habbo_skin_button_close_xml:Class = habbo_skin_button_close;
      
      public static var habbo_skin_button_close_black_xml:Class = class_2386;
      
      public static var habbo_skin_button_close_white_xml:Class = habbo_skin_button_close_white_xml;
      
      public static var habbo_skin_button_close_3_xml:Class = habbo_skin_button_close_3_xml;
      
      public static var habbo_skin_button_help_3_xml:Class = class_2391;
      
      public static var habbo_skin_button_radio_xml:Class = habbo_skin_button_radio_xml;
      
      public static var habbo_skin_button_radio_black_xml:Class = class_2392;
      
      public static var habbo_skin_button_radio_white_xml:Class = class_2393;
      
      public static var habbo_skin_button_tab_xml:Class = class_2397;
      
      public static var habbo_skin_button_tab_black_xml:Class = habbo_skin_button_tab_black_xml;
      
      public static var habbo_skin_button_tab_white_xml:Class = habbo_skin_button_tab_white_xml;
      
      public static var habbo_skin_button_tab_3_xml:Class = habbo_skin_button_tab_3_xml;
      
      public static var habbo_skin_tab_content_3_xml:Class = class_2410;
      
      public static var habbo_skin_scaler_xml:Class = habbo_skin_scaler_xml;
      
      public static var habbo_skin_scaler_black_xml:Class = habbo_skin_scaler_black_xml;
      
      public static var habbo_skin_scaler_white_xml:Class = class_2408;
      
      public static var habbo_skin_scaler_3_xml:Class = class_2407;
      
      public static var habbo_skin_scrollbar_xml:Class = habbo_skin_scrollbar_xml;
      
      public static var habbo_skin_scrollbar_black_xml:Class = class_2409;
      
      public static var habbo_skin_scrollbar_3_xml:Class = habbo_skin_scrollbar_3_xml;
      
      public static var habbo_skin_header_xml:Class = habbo_skin_header_xml;
      
      public static var habbo_skin_header_3_xml:Class = class_2403;
      
      public static var habbo_skin_header_7_xml:Class = class_2404;
      
      public static var habbo_skin_icon_set_xml:Class = class_2405;
      
      public static var habbo_skin_dropmenu_xml:Class = habbo_skin_dropmenu_xml;
      
      public static var habbo_skin_dropmenu_3_xml:Class = habbo_skin_dropmenu_3_xml;

      public static var habbo_skin_dropmenu_black_xml:Class = habbo_skin_dropmenu_black_xml;
      
      public static var habbo_skin_droplist_xml:Class = class_2400;
      
      public static var habbo_skin_droplist_thick_xml:Class = habbo_skin_droplist_thick_xml;
      
      public static var habbo_skin_tab_context_xml:Class = habbo_skin_tab_context_xml;
      
      public static var habbo_skin_border_black_xml:Class = habbo_skin_border_black_xml;
      
      public static var habbo_skin_border_colorless_xml:Class = habbo_skin_border_colorless_xml;
      
      public static var habbo_skin_border_colorless_dropshadow_xml:Class = habbo_skin_border_colorless_dropshadow_xml;
      
      public static var habbo_skin_border_white_xml:Class = habbo_skin_border_white_xml;
      
      public static var habbo_skin_border_slot_xml:Class = class_2377;
      
      public static var habbo_skin_border_4_xml:Class = class_2371;
      
      public static var habbo_skin_border_5_xml:Class = class_2372;
      
      public static var habbo_skin_border_6_xml:Class = class_2373;
      
      public static var habbo_skin_border_7_xml:Class = class_2374;
      
      public static var habbo_skin_border_8_xml:Class = class_2375;
      
      public static var habbo_skin_border_9_xml:Class = class_2376;
      
      public static var habbo_skin_text_xml:Class = class_2411;
      
      public static var habbo_skin_tooltip_xml:Class = habbo_skin_tooltip_xml;
      
      public static var text_styles_css:Class = styles_css;
      
      public static var habbo_blue_skin_png;
      
      public static var habbo_skin_ubuntu_png;
      
      public static var skin_ubuntu_bg_9:Class = ubuntu_bg_9_png;
      
      public static var habbo_cursor_link_png;
      
      public static var habbo_cursor_drag_png;
      
      public static var habbo_icons_png;
      
      public static var placeholder_avatar_png;
      
      public static var placeholder_avatar_head_png;
      
      public static var placeholder_avatar_cropped_png;
      
      public static var placeholder_avatar_head_cropped_png;
      
      public static var placeholder_avatar_small_png;
      
      public static var placeholder_avatar_small_head_png;
      
      public static var placeholder_avatar_small_cropped_png;
      
      public static var placeholder_avatar_small_head_cropped_png;
      
      public static var placeholder_pet_png;
      
      public static var placeholder_pet_small_png;
      
      public static var placeholder_furni_png;
      
      public static var placeholder_furni_small_png;
      
      public static var sticker_croco:Class = class_2928;
      
      public static var volter:Class = class_1725;
      
      public static var volterb:Class = class_1724;
      
      public static var ubuntu_regular:Class = class_1722;
      
      public static var ubuntu_bold:Class = class_1718;
      
      public static var ubuntu_condensed:Class = class_1719;
      
      public static var ubuntuThick_bold:Class = class_1723;
      
      public static var ubuntu_italic:Class = class_1720;
      
      public static var ubuntu_bold_italic:Class = class_1717;
      
      public static var ubuntuMedium:Class = class_1721;
      
      public static var habbo_window_alert_xml:Class = habbo_window_alert_xml;
      
      public static var habbo_window_alert_link_xml:Class = class_2414;
      
      public static var habbo_window_confirm_xml:Class = habbo_window_confirm_xml;
      
      public static var habbo_crasher_dialog_xml:Class = habbo_crasher_dialog_xml;
      
      public static var unseen_item_counter_xml:Class = unseen_item_counter_xml;
      
      public static var simple_alert_xml:Class = simple_alert_xml;
      
      public static var illumina_alert_illustrations_frank_neutral_png;
      
      public static var habbo_skin_illumina_light_png;
      
      public static var illumina_light_balloon_png;
      
      public static var illumina_light_border_etched_png;
      
      public static var illumina_light_border_frame_png;
      
      public static var illumina_light_border_infobox_png;
      
      public static var illumina_light_border_light_png;
      
      public static var illumina_light_border_raised_png;
      
      public static var illumina_light_border_sunk_png;
      
      public static var illumina_light_bubble_chat_arrow_png;
      
      public static var illumina_light_bubble_chat_bg_png;
      
      public static var illumina_light_button_default_png;
      
      public static var illumina_light_button_frame_close_png;
      
      public static var illumina_light_button_unetched_png;
      
      public static var illumina_light_checkbox_basic_png;
      
      public static var illumina_light_clock_background_png;
      
      public static var illumina_light_clock_background_left_png;
      
      public static var illumina_light_clock_background_mid_png;
      
      public static var illumina_light_clock_background_right_png;
      
      public static var illumina_light_icons_png;
      
      public static var illumina_light_input_chat_png;
      
      public static var illumina_light_progress_indicator_etched_png;
      
      public static var illumina_light_progress_indicator_flat_png;
      
      public static var illumina_light_radio_button_png;
      
      public static var illumina_light_scrollbar_horizontal_png;
      
      public static var illumina_light_scrollbar_vertical_png;
      
      public static var illumina_light_separator_png;
      
      public static var illumina_light_switch_png;
      
      public static var illumina_light_skin_border_xml:Class = class_2518;
      
      public static var illumina_light_skin_border_sunk_xml:Class = illumina_light_skin_border_sunk_xml;
      
      public static var illumina_light_skin_border_light_xml:Class = class_2517;
      
      public static var illumina_light_skin_border_raised_xml:Class = illumina_light_skin_border_raised_xml;
      
      public static var illumina_light_skin_border_input_xml:Class = illumina_light_skin_border_input_xml;
      
      public static var illumina_light_skin_border_chat_bubble_xml:Class = class_2515;
      
      public static var illumina_light_skin_border_balloon_xml:Class = illumina_light_skin_border_balloon_xml;
      
      public static var illumina_light_skin_border_infobox_xml:Class = class_2516;
      
      public static var illumina_light_frame_xml:Class = class_2508;
      
      public static var illumina_light_frame_modal_xml:Class = illumina_light_frame_modal_xml;
      
      public static var illumina_light_skin_frame_xml:Class = illumina_light_skin_frame_xml;
      
      public static var illumina_light_button_xml:Class = class_2504;
      
      public static var illumina_light_button_plain_xml:Class = illumina_light_button_plain_xml;
      
      public static var illumina_light_skin_button_xml:Class = illumina_light_skin_button_xml;
      
      public static var illumina_light_skin_button_plain_xml:Class = class_2519;
      
      public static var illumina_light_skin_button_unetched_xml:Class = class_2520;
      
      public static var illumina_light_checkbox_basic_xml:Class = class_2505;
      
      public static var illumina_light_skin_checkbox_basic_xml:Class = illumina_light_skin_checkbox_basic_xml;
      
      public static var illumina_light_switch_xml:Class = class_2522;
      
      public static var illumina_light_skin_switch_xml:Class = illumina_light_skin_switch_xml;
      
      public static var illumina_light_radio_button_xml:Class = illumina_light_radio_button_xml;
      
      public static var illumina_light_skin_radio_button_xml:Class = class_2521;
      
      public static var illumina_light_scrollbar_horizontal_xml:Class = illumina_light_scrollbar_horizontal_xml;
      
      public static var illumina_light_scrollbar_vertical_xml:Class = illumina_light_scrollbar_vertical_xml;
      
      public static var illumina_light_skin_scrollbar_xml:Class = illumina_light_skin_scrollbar_xml;
      
      public static var illumina_light_scrollable_itemlist_vertical_xml:Class = class_2512;
      
      public static var illumina_light_dropmenu_item_xml:Class = illumina_light_dropmenu_item_xml;
      
      public static var illumina_light_dropmenu_xml:Class = illumina_light_dropmenu_xml;
      
      public static var habbo_skin_illumina_dark_png;
      
      public static var illumina_dark_skin_border_xml:Class = illumina_dark_skin_border_xml;
      
      public static var illumina_dark_frame_xml:Class = illumina_dark_frame_xml;
      
      public static var illumina_dark_skin_frame_xml:Class = class_2498;
      
      public static var illumina_dark_header_xml:Class = class_2496;
      
      public static var illumina_dark_skin_header_xml:Class = illumina_dark_skin_header_xml;
      
      public static var illumina_dark_button_xml:Class = illumina_dark_button_xml;
      
      public static var illumina_dark_skin_button_xml:Class = illumina_dark_skin_button_xml;
      
      public static var illumina_dark_scrollbar_horizontal_xml:Class = illumina_dark_scrollbar_horizontal_xml;
      
      public static var illumina_dark_scrollbar_vertical_xml:Class = class_2497;
      
      public static var illumina_dark_skin_scrollbar_xml:Class = class_2499;
      
      public static var illumina_dark_scrollbar_horizontal_png;
      
      public static var illumina_dark_scrollbar_vertical_png;
      
      public static var achievement_ach_progressbar1:Class = ach_progressbar1_png;
      
      public static var achievement_ach_progressbar2:Class = ach_progressbar2_png;
      
      public static var achievement_ach_progressbar3:Class = ach_progressbar3_png;
      
      public static var achievement_ach_progressbar4:Class = ach_progressbar4_png;
      
      public static var achievement_ach_progressbar5:Class = ach_progressbar5_png;
      
      public static var avatar_editor_avatar_editor_download_icon:Class = class_1782;
      
      public static var avatar_editor_editor_clr_13x21_1:Class = editor_clr_13x21_1_png;
      
      public static var avatar_editor_editor_clr_13x21_2:Class = editor_clr_13x21_2_png;
      
      public static var avatar_editor_editor_clr_13x21_3:Class = editor_clr_13x21_3_png;
      
      public static var avatar_editor_editor_clr_40x32_1:Class = class_2056;
      
      public static var avatar_editor_editor_clr_40x32_2:Class = class_2057;
      
      public static var avatar_editor_editor_clr_40x32_3:Class = class_2058;
      
      public static var avatar_editor_generic_platform:Class = platform_png;
      
      public static var avatar_editor_generic_remove_selection:Class = remove_selection_png;
      
      public static var avatar_editor_parts_hilite:Class = parts_hilite_png;
      
      public static var avatar_editor_parts_hilite_with_sd:Class = class_2716;
      
      public static var avatar_editor_rotate_avatar_button:Class = rotate_avatar_button_png;
      
      public static var avatar_editor_tabs_ae_tabs_effects:Class = ae_tabs_effects_png;
      
      public static var avatar_editor_tabs_ae_tabs_generic:Class = class_1770;
      
      public static var avatar_editor_tabs_ae_tabs_head:Class = ae_tabs_head_png;
      
      public static var avatar_editor_tabs_ae_tabs_hotlooks:Class = ae_tabs_hotlooks_png;
      
      public static var avatar_editor_tabs_ae_tabs_legs:Class = class_1771;
      
      public static var avatar_editor_tabs_ae_tabs_torso:Class = ae_tabs_torso_png;
      
      public static var avatar_editor_tabs_ae_tabs_wardrobe:Class = ae_tabs_wardrobe_png;
      
      public static var avatar_editor_tabs_bottom_accessories:Class = class_1809;
      
      public static var avatar_editor_tabs_bottom_accessories_on:Class = class_1808;
      
      public static var avatar_editor_tabs_bottom_shoes:Class = bottom_shoes_png;
      
      public static var avatar_editor_tabs_bottom_shoes_on:Class = bottom_shoes_on_png;
      
      public static var avatar_editor_tabs_bottom_trousers:Class = class_1810;
      
      public static var avatar_editor_tabs_bottom_trousers_on:Class = bottom_trousers_on_png;
      
      public static var avatar_editor_tabs_effects_fx:Class = class_2061;
      
      public static var avatar_editor_tabs_gender_female:Class = class_2267;
      
      public static var avatar_editor_tabs_gender_female_on:Class = class_2266;
      
      public static var avatar_editor_tabs_gender_male:Class = gender_male_png;
      
      public static var avatar_editor_tabs_gender_male_on:Class = gender_male_on_png;
      
      public static var avatar_editor_tabs_head_accessories:Class = class_2423;
      
      public static var avatar_editor_tabs_head_accessories_on:Class = head_accessories_on_png;
      
      public static var avatar_editor_tabs_head_eyewear:Class = head_eyewear_png;
      
      public static var avatar_editor_tabs_head_eyewear_on:Class = class_2424;
      
      public static var avatar_editor_tabs_head_face_accessories:Class = head_face_accessories_png;
      
      public static var avatar_editor_tabs_head_face_accessories_on:Class = class_2425;
      
      public static var avatar_editor_tabs_head_hair:Class = head_hair_png;
      
      public static var avatar_editor_tabs_head_hair_on:Class = head_hair_on_png;
      
      public static var avatar_editor_tabs_head_hats:Class = head_hats_png;
      
      public static var avatar_editor_tabs_head_hats_on:Class = class_2426;
      
      public static var avatar_editor_tabs_top_accessories:Class = top_accessories_png;
      
      public static var avatar_editor_tabs_top_accessories_on:Class = class_3005;
      
      public static var avatar_editor_tabs_top_jacket:Class = class_3007;
      
      public static var avatar_editor_tabs_top_jacket_on:Class = class_3006;
      
      public static var avatar_editor_tabs_top_prints:Class = class_3008;
      
      public static var avatar_editor_tabs_top_prints_on:Class = top_prints_on_png;
      
      public static var avatar_editor_tabs_top_shirt:Class = class_3010;
      
      public static var avatar_editor_tabs_top_shirt_on:Class = class_3009;
      
      public static var avatar_editor_wardrobe_select_outfit:Class = class_2839;
      
      public static var avatar_editor_wardrobe_select_outfit_over:Class = select_outfit_over_png;
      
      public static var avatar_editor_wardrobe_wardrobe_empty_slot:Class = wardrobe_empty_slot_png;
      
      public static var nft_pixel_icon:Class = class_2472;
      
      public static var bottom_bar_buildersclub:Class = class_1856;
      
      public static var bottom_bar_camera:Class = class_1878;
      
      public static var bottom_bar_collapse_left:Class = collapse_left_png;
      
      public static var bottom_bar_collapse_right:Class = collapse_right_png;
      
      public static var bottom_bar_divider_1px:Class = class_2039;
      
      public static var bottom_bar_games:Class = class_2265;
      
      public static var bottom_bar_home:Class = class_2435;
      
      public static var bottom_bar_inventory:Class = class_2528;
      
      public static var bottom_bar_logo:Class = logo_png;
      
      public static var bottom_bar_navigator:Class = class_2679;
      
      public static var bottom_bar_quests:Class = quests_png;
      
      public static var bottom_bar_shop:Class = class_2877;
      
      public static var bottom_bar_stories:Class = class_2936;
      
      public static var camera_arrow_gray:Class = arrow_gray_png;
      
      public static var camera_arrow_green:Class = arrow_green_png;
      
      public static var camera_browse_ffwd:Class = browse_ffwd_png;
      
      public static var camera_cam_bg:Class = cam_bg_png;
      
      public static var camera_cam_btn_hi:Class = class_1872;
      
      public static var camera_cam_close_x:Class = class_1873;
      
      public static var camera_camera_btn:Class = camera_btn_png;
      
      public static var camera_camera_btn_down:Class = class_1874;
      
      public static var camera_camera_edit:Class = class_1875;
      
      public static var camera_camera_icon:Class = camera_icon_png;
      
      public static var camera_fx_button_active:Class = class_2123;
      
      public static var camera_fx_button_outline:Class = class_2124;
      
      public static var camera_fx_button_selected:Class = class_2125;
      
      public static var camera_fx_frame_selected:Class = class_2126;
      
      public static var camera_fx_slider_bottom_active:Class = fx_slider_bottom_active_png;
      
      public static var camera_fx_slider_button:Class = class_2262;
      
      public static var camera_habbo_camera:Class = habbo_camera_png;
      
      public static var camera_icon_colorfilter:Class = icon_colorfilter_png;
      
      public static var camera_icon_compositefilter:Class = icon_compositefilter_png;
      
      public static var camera_icon_frame:Class = class_2462;
      
      public static var camera_locked:Class = locked_png;
      
      public static var camera_photo_border:Class = class_2728;
      
      public static var camera_remove_effect:Class = remove_effect_png;
      
      public static var camera_retake_button:Class = class_2802;
      
      public static var camera_shadow_outline:Class = shadow_outline_png;
      
      public static var camera_viewfinder:Class = viewfinder_png;
      
      public static var camera_zoom_in:Class = class_3124;
      
      public static var camera_zoom_out:Class = zoom_out_png;
      
      public static var campaign_day_generic_activated:Class = day_generic_activated_png;
      
      public static var campaign_day_generic_bg:Class = day_generic_bg_png;
      
      public static var campaign_day_generic_button:Class = day_generic_button_png;
      
      public static var campaign_generic_lock:Class = class_2268;
      
      public static var campaign_calendar_icon:Class = class_2439;
      
      public static var campaign_opened:Class = class_2709;
      
      public static var catalogue_background:Class = class_1787;
      
      public static var catalogue_badge_background:Class = class_1790;
      
      public static var catalogue_bundle_star:Class = class_1857;
      
      public static var catalogue_clakboard:Class = clakboard_png;
      
      public static var catalogue_color_picker_27x22_border:Class = class_2008;
      
      public static var catalogue_color_picker_27x22_color:Class = color_picker_27x22_color_png;
      
      public static var catalogue_color_picker_27x22_selection:Class = class_2009;
      
      public static var catalogue_effects_ninja:Class = class_2062;
      
      public static var catalogue_giftcard_blank:Class = class_2275;
      
      public static var catalogue_ufo_pricebg:Class = class_3052;
      
      public static var common_beta_sign:Class = beta_sign_png;
      
      public static var common_blue_arrow_horizontal:Class = blue_arrow_horizontal_png;
      
      public static var common_blue_arrow_vertical:Class = class_1802;
      
      public static var common_chat_indicator:Class = class_1976;
      
      public static var common_chat_style_block:Class = class_1980;
      
      public static var common_chat_styles:Class = chat_styles_png;
      
      public static var common_chisel:Class = class_1986;
      
      public static var common_close_x:Class = class_1990;
      
      public static var common_green_arrow_horizontal:Class = green_arrow_horizontal_png;
      
      public static var common_green_arrow_vertical:Class = green_arrow_vertical_png;
      
      public static var common_hilight_big:Class = hilight_big_png;
      
      public static var common_info_icon_grey:Class = info_icon_grey_png;
      
      public static var common_item_selected:Class = class_2536;
      
      public static var common_item_unselected:Class = class_2537;
      
      public static var common_loading_icon:Class = loading_icon_png;
      
      public static var common_maximize:Class = class_2620;
      
      public static var common_maximize_unetched:Class = class_2621;
      
      public static var common_minimize_unetched:Class = class_2659;
      
      public static var common_offers_icon:Class = offers_icon_png;
      
      public static var common_promo_arrow_close:Class = class_2766;
      
      public static var common_promo_arrow_top_right:Class = promo_arrow_top_right_png;
      
      public static var common_small_coin:Class = class_2888;
      
      public static var common_small_pen:Class = class_2890;
      
      public static var common_star:Class = star_png;
      
      public static var common_trashcan_big:Class = trashcan_big_png;
      
      public static var common_trashcan_small:Class = class_3014;
      
      public static var common_welcome_screen_arrow:Class = welcome_screen_arrow_png;
      
      public static var craft_craft_bg:Class = class_2016;
      
      public static var extended_profile_clear_favourite:Class = clear_favourite_png;
      
      public static var extended_profile_make_favourite:Class = make_favourite_png;
      
      public static var extended_profile_rooms:Class = class_2822;
      
      public static var extended_profile_star_gems:Class = class_2483;
      
      public static var extended_profile_level:Class = class_2468;
      
      public static var floor_plan_editor_add_tile:Class = class_1769;
      
      public static var floor_plan_editor_enter_tile:Class = class_2072;
      
      public static var floor_plan_editor_logo:Class = class_2591;
      
      public static var floor_plan_editor_raise_tile:Class = class_2782;
      
      public static var floor_plan_editor_remove_tile:Class = remove_tile_png;
      
      public static var floor_plan_editor_sink_tile:Class = sink_tile_png;
      
      public static var forum_forum_edit:Class = forum_edit_png;
      
      public static var forum_forum_hide:Class = forum_hide_png;
      
      public static var forum_forum_list0:Class = class_2095;
      
      public static var forum_forum_list1:Class = class_2096;
      
      public static var forum_forum_list2:Class = class_2097;
      
      public static var forum_forum_locked:Class = forum_locked_png;
      
      public static var forum_forum_pinned:Class = class_2098;
      
      public static var forum_forum_report:Class = forum_report_png;
      
      public static var forum_forum_unhide:Class = class_2100;
      
      public static var forum_forum_unlocked:Class = forum_unlocked_png;
      
      public static var forum_forum_unpinned:Class = class_2101;
      
      public static var forum_reply:Class = class_2800;
      
      public static var friend_bar_all_friends:Class = all_friends_png;
      
      public static var friend_bar_event_notification_icon:Class = event_notification_icon_png;
      
      public static var snowball_notification_icon:Class = class_2892;
      
      public static var friend_bar_friendlist_chat:Class = class_2113;
      
      public static var friend_bar_friendlist_eye:Class = friendlist_eye_png;
      
      public static var friend_bar_friendlist_go_room:Class = class_2114;
      
      public static var friend_bar_friendlist_messenger:Class = class_2115;
      
      public static var friend_bar_friendlist_messenger_notify_0:Class = friendlist_messenger_notify_0_png;
      
      public static var friend_bar_friendlist_messenger_notify_1:Class = friendlist_messenger_notify_1_png;
      
      public static var friend_bar_friends_browse_bg:Class = class_2118;
      
      public static var friend_bar_search_habbos:Class = search_habbos_png;
      
      public static var game_center_achievement_locked_icon:Class = achievement_locked_icon_png;
      
      public static var game_center_loading_icon:Class = loading_icon_png;
      
      public static var group_guild_color_btm:Class = guild_color_btm_png;
      
      public static var group_guild_color_top:Class = class_2308;
      
      public static var hc_center_hc_center_cover:Class = hc_center_cover_png;
      
      public static var hc_center_hc_center_icon_credits:Class = class_2415;
      
      public static var hc_center_hc_center_illustration:Class = hc_center_illustration_png;
      
      public static var hc_center_hc_center_timer:Class = class_2416;
      
      public static var hc_center_hc_postit_bg:Class = class_2420;
      
      public static var hc_center_t0:Class = class_2952;
      
      public static var hc_center_t1:Class = class_2953;
      
      public static var hc_center_t2:Class = class_2954;
      
      public static var hc_center_t3:Class = class_2955;
      
      public static var hc_center_t4:Class = class_2956;
      
      public static var hc_center_t5:Class = class_2957;
      
      public static var hc_center_t6:Class = class_2958;
      
      public static var hc_center_t7:Class = class_2959;
      
      public static var hc_center_t8:Class = class_2960;
      
      public static var hc_center_t9:Class = class_2961;
      
      public static var help_accept_icon:Class = class_1754;
      
      public static var help_bandaid:Class = bandaid_png;
      
      public static var help_chat_review_anonymous:Class = class_1773;
      
      public static var help_chat_review_avatar_anonymous:Class = avatar_anonymous_png;
      
      public static var help_chat_review_avatar_perpetrator:Class = avatar_perpetrator_png;
      
      public static var help_chat_review_decision_bad:Class = class_2029;
      
      public static var help_chat_review_decision_ok:Class = class_2030;
      
      public static var help_chat_review_decision_refused:Class = decision_refused_png;
      
      public static var help_chat_review_decision_searching_1:Class = decision_searching_1_png;
      
      public static var help_chat_review_decision_searching_2:Class = decision_searching_2_png;
      
      public static var help_chat_review_decision_undecided:Class = decision_undecided_png;
      
      public static var help_chat_review_decision_very_bad:Class = decision_very_bad_png;
      
      public static var help_chat_review_decision_waiting_1:Class = class_2031;
      
      public static var help_chat_review_decision_waiting_2:Class = class_2032;
      
      public static var help_chat_review_perpetrator:Class = perpetrator_png;
      
      public static var help_chat_review_progress_big_1:Class = class_2762;
      
      public static var help_chat_review_progress_big_2:Class = class_2763;
      
      public static var help_chat_review_progress_big_3:Class = class_2764;
      
      public static var help_chat_review_progress_big_4:Class = class_2765;
      
      public static var help_chat_review_vote_bad:Class = class_3115;
      
      public static var help_chat_review_vote_bad_down:Class = vote_bad_down_png;
      
      public static var help_chat_review_vote_bad_over:Class = vote_bad_over_png;
      
      public static var help_chat_review_vote_ok:Class = vote_ok_png;
      
      public static var help_chat_review_vote_ok_down:Class = class_3116;
      
      public static var help_chat_review_vote_ok_over:Class = class_3117;
      
      public static var help_chat_review_vote_very_bad:Class = class_3119;
      
      public static var help_chat_review_vote_very_bad_down:Class = vote_very_bad_down_png;
      
      public static var help_chat_review_vote_very_bad_over:Class = class_3118;
      
      public static var help_citizenship_default:Class = citizenship_default_png;
      
      public static var help_decline_icon:Class = class_2033;
      
      public static var help_error_state:Class = error_state_png;
      
      public static var help_feeling_confused:Class = feeling_confused_png;
      
      public static var help_feeling_confused_coming_up:Class = class_2088;
      
      public static var help_frank_greeting:Class = frank_greeting_png;
      
      public static var help_guide_accept:Class = guide_accept_png;
      
      public static var help_guide_icon:Class = class_2303;
      
      public static var help_habboway_correct:Class = class_2015;
      
      public static var help_habboway_dove_off:Class = dove_off_png;
      
      public static var help_habboway_dove_on:Class = dove_on_png;
      
      public static var help_habboway_dove_quizz:Class = class_2041;
      
      public static var help_habboway_next:Class = next_png;
      
      public static var help_habboway_prev:Class = class_2757;
      
      public static var help_habboway_wrong:Class = wrong_png;
      
      public static var help_help_duck:Class = class_2430;
      
      public static var help_illustrations_bully:Class = bully_png;
      
      public static var help_illustrations_question:Class = class_2777;
      
      public static var help_illustrations_tour:Class = tour_png;
      
      public static var help_need_help:Class = need_help_png;
      
      public static var help_notification:Class = class_2694;
      
      public static var help_poor_frank:Class = class_2751;
      
      public static var help_requester_icon:Class = requester_icon_png;
      
      public static var help_user_create:Class = class_3089;
      
      public static var help_user_feedback:Class = user_feedback_png;
      
      public static var help_user_pending:Class = class_3101;
      
      public static var high_score_highscore_cup:Class = highscore_cup_png;
      
      public static var icons_back:Class = back_png;
      
      public static var icons_back_small:Class = back_small_png;
      
      public static var icons_builder_error_full:Class = class_2075;
      
      public static var icons_builder_error_furnilimit:Class = class_2076;
      
      public static var icons_builder_error_grouproom:Class = error_grouproom_png;
      
      public static var icons_builder_error_notroom:Class = error_notroom_png;
      
      public static var icons_builder_error_room:Class = error_room_png;
      
      public static var icons_builder_error_userinroom:Class = class_2077;
      
      public static var icons_close:Class = class_1989;
      
      public static var icons_facebook:Class = class_2083;
      
      public static var icons_flag:Class = class_2091;
      
      public static var icons_forward:Class = class_2102;
      
      public static var icons_forward_small:Class = class_2103;
      
      public static var icons_go_to_room_icon:Class = go_to_room_icon_png;
      
      public static var icons_hc_icon_small:Class = class_2419;
      
      public static var icons_hilighter_yellow:Class = class_2432;
      
      public static var icons_link_icon:Class = class_2578;
      
      public static var icons_next:Class = class_2688;
      
      public static var icons_panic:Class = class_2714;
      
      public static var icons_share:Class = class_2875;
      
      public static var icons_star:Class = class_2927;
      
      public static var icons_tickmark:Class = class_3000;
      
      public static var icons_toolbar_achievements_hover:Class = achievements_hover_png;
      
      public static var icons_toolbar_achievements_normal:Class = achievements_normal_png;
      
      public static var icons_toolbar_builder_hover:Class = class_1854;
      
      public static var icons_toolbar_builder_normal:Class = class_1855;
      
      public static var icons_toolbar_catalogue_hover:Class = catalogue_hover_png;
      
      public static var icons_toolbar_catalogue_normal:Class = catalogue_normal_png;
      
      public static var icons_toolbar_divider:Class = divider_png;
      
      public static var icons_toolbar_games_hover:Class = class_2263;
      
      public static var icons_toolbar_games_normal:Class = class_2264;
      
      public static var icons_toolbar_home_hover:Class = home_hover_png;
      
      public static var icons_toolbar_home_normal:Class = home_normal_png;
      
      public static var icons_toolbar_inventory_hover:Class = inventory_hover_png;
      
      public static var icons_toolbar_inventory_normal:Class = inventory_normal_png;
      
      public static var icons_toolbar_me_menu_placeholder:Class = class_2626;
      
      public static var icons_toolbar_minimail_hover:Class = minimail_hover_png;
      
      public static var icons_toolbar_minimail_normal:Class = minimail_normal_png;
      
      public static var icons_toolbar_navigator_hover:Class = navigator_hover_png;
      
      public static var icons_toolbar_navigator_normal:Class = navigator_normal_png;
      
      public static var icons_toolbar_quests_hover:Class = class_2778;
      
      public static var icons_toolbar_quests_normal:Class = quests_normal_png;
      
      public static var icons_toolbar_reception_hover:Class = reception_hover_png;
      
      public static var icons_toolbar_reception_normal:Class = reception_normal_png;
      
      public static var icons_toolbar_stories_hover:Class = stories_hover_png;
      
      public static var icons_toolbar_stories_normal:Class = stories_normal_png;
      
      public static var icons_toolbar_valentines_hover:Class = valentines_hover_png;
      
      public static var icons_toolbar_valentines_normal:Class = valentines_normal_png;
      
      public static var icons_toolbar_xmas_hover:Class = xmas_hover_png;
      
      public static var icons_toolbar_xmas_normal:Class = xmas_normal_png;
      
      public static var icons_twitter:Class = twitter_png;
      
      public static var icons_wearable:Class = wearable_png;
      
      public static var illumina_horizontal_separator:Class = horizontal_separator_png;
      
      public static var infostand_bot_info_bg:Class = bot_info_bg_png;
      
      public static var inventory_download_icon:Class = download_icon_png;
      
      public static var inventory_furni_icon_credits:Class = class_2459;
      
      public static var inventory_furni_icon_floor:Class = icon_floor_png;
      
      public static var inventory_furni_icon_landscape:Class = icon_landscape_png;
      
      public static var inventory_furni_icon_wallpaper:Class = class_2489;
      
      public static var inventory_furni_no_trade_icon:Class = no_trade_icon_png;
      
      public static var inventory_furni_trade_icon:Class = trade_icon_png;
      
      public static var inventory_inventory_empty:Class = class_2526;
      
      public static var inventory_inventory_icon:Class = class_2527;
      
      public static var inventory_thumb_bg:Class = class_2994;
      
      public static var inventory_thumb_bg_selected:Class = class_2996;
      
      public static var inventory_thumb_rent_ending:Class = class_2997;
      
      public static var inventory_thumb_rent_started:Class = thumb_rent_started_png;
      
      public static var inventory_thumb_selected_outline:Class = class_2998;
      
      public static var inventory_trading_trading_locked_icon:Class = trading_locked_icon_png;
      
      public static var inventory_trading_trading_unlocked_icon:Class = trading_unlocked_icon_png;
      
      public static var landing_view_avatar_info_background:Class = class_1785;
      
      public static var landing_view_needle_meter_needle0:Class = meter_needle0_png;
      
      public static var landing_view_needle_meter_needle1:Class = meter_needle1_png;
      
      public static var landing_view_needle_meter_needle10:Class = class_2641;
      
      public static var landing_view_needle_meter_needle11:Class = class_2642;
      
      public static var landing_view_needle_meter_needle12:Class = class_2643;
      
      public static var landing_view_needle_meter_needle13:Class = class_2644;
      
      public static var landing_view_needle_meter_needle14:Class = class_2645;
      
      public static var landing_view_needle_meter_needle15:Class = class_2646;
      
      public static var landing_view_needle_meter_needle16:Class = class_2647;
      
      public static var landing_view_needle_meter_needle17:Class = class_2648;
      
      public static var landing_view_needle_meter_needle18:Class = class_2649;
      
      public static var landing_view_needle_meter_needle19:Class = class_2650;
      
      public static var landing_view_needle_meter_needle2:Class = meter_needle2_png;
      
      public static var landing_view_needle_meter_needle20:Class = class_2651;
      
      public static var landing_view_needle_meter_needle21:Class = class_2652;
      
      public static var landing_view_needle_meter_needle22:Class = class_2653;
      
      public static var landing_view_needle_meter_needle23:Class = class_2654;
      
      public static var landing_view_needle_meter_needle3:Class = meter_needle3_png;
      
      public static var landing_view_needle_meter_needle4:Class = meter_needle4_png;
      
      public static var landing_view_needle_meter_needle5:Class = meter_needle5_png;
      
      public static var landing_view_needle_meter_needle6:Class = meter_needle6_png;
      
      public static var landing_view_needle_meter_needle7:Class = meter_needle7_png;
      
      public static var landing_view_needle_meter_needle8:Class = meter_needle8_png;
      
      public static var landing_view_needle_meter_needle9:Class = meter_needle9_png;
      
      public static var landing_view_reception_horizontal:Class = reception_horizontal_png;
      
      public static var me_menu_me_achv:Class = class_2622;
      
      public static var me_menu_me_clothing:Class = me_clothing_png;
      
      public static var me_menu_me_forums:Class = class_2623;
      
      public static var me_menu_me_guide:Class = me_guide_png;
      
      public static var me_menu_me_mail:Class = me_mail_png;
      
      public static var me_menu_me_profile:Class = me_profile_png;
      
      public static var me_menu_me_rooms:Class = class_2627;
      
      public static var me_menu_me_talents:Class = class_2628;
      
      public static var messenger_caution:Class = caution_png;
      
      public static var messenger_minimize_button:Class = minimize_button_png;
      
      public static var messenger_notification_icon:Class = notification_icon_png;
      
      public static var messenger_profile_icon:Class = class_2761;
      
      public static var messenger_visit_icon:Class = visit_icon_png;
      
      public static var mysterybox_box_base:Class = box_base_png;
      
      public static var mysterybox_box_overlay:Class = box_overlay_png;
      
      public static var mysterybox_box_small:Class = box_small_png;
      
      public static var mysterybox_key_base:Class = class_2540;
      
      public static var mysterybox_key_overlay:Class = key_overlay_png;
      
      public static var mysterybox_key_small:Class = class_2541;
      
      public static var mysterybox_tracker_border:Class = tracker_border_png;
      
      public static var navigation_icon_weblink:Class = class_2491;
      
      public static var newnavigator_button_back:Class = button_back_png;
      
      public static var newnavigator_button_category_collapse:Class = button_category_collapse_png;
      
      public static var newnavigator_button_category_expand:Class = button_category_expand_png;
      
      public static var newnavigator_button_category_show_more:Class = button_category_show_more_png;
      
      public static var newnavigator_button_leftpane_hide:Class = class_1859;
      
      public static var newnavigator_button_leftpane_show:Class = class_1860;
      
      public static var newnavigator_button_quicklink_add:Class = button_quicklink_add_png;
      
      public static var newnavigator_button_quicklink_remove:Class = class_1861;
      
      public static var newnavigator_button_rows:Class = class_1862;
      
      public static var newnavigator_button_show_room_info:Class = class_1867;
      
      public static var newnavigator_button_tiles:Class = button_tiles_png;
      
      public static var newnavigator_create_room:Class = create_room_png;
      
      public static var newnavigator_default_room:Class = class_2034;
      
      public static var newnavigator_doormode_doorbell_small:Class = doormode_doorbell_small_png;
      
      public static var newnavigator_doormode_invisible_small:Class = doormode_invisible_small_png;
      
      public static var newnavigator_doormode_password_small:Class = doormode_password_small_png;
      
      public static var newnavigator_event_icon:Class = event_icon_png;
      
      public static var newnavigator_group_base_icon:Class = group_base_icon_png;
      
      public static var newnavigator_icon_fav_no:Class = icon_fav_no_png;
      
      public static var newnavigator_icon_fav_yes:Class = class_2461;
      
      public static var newnavigator_icon_group:Class = icon_group_png;
      
      public static var newnavigator_icon_group_admin:Class = class_2463;
      
      public static var newnavigator_icon_group_owner:Class = class_2464;
      
      public static var newnavigator_icon_home_no:Class = icon_home_no_png;
      
      public static var newnavigator_icon_home_yes:Class = icon_home_yes_png;
      
      public static var newnavigator_icon_ql_add:Class = class_2480;
      
      public static var newnavigator_icon_ql_remove:Class = class_2481;
      
      public static var newnavigator_icon_quicklink_plain:Class = icon_quicklink_plain_png;
      
      public static var newnavigator_icon_usercount:Class = class_2485;
      
      public static var newnavigator_nav_view_mini:Class = nav_view_mini_png;
      
      public static var newnavigator_nav_view_row:Class = nav_view_row_png;
      
      public static var newnavigator_nav_view_thumbs:Class = class_2670;
      
      public static var newnavigator_promote_room:Class = promote_room_png;
      
      public static var newnavigator_random_room:Class = class_2783;
      
      public static var newnavigator_rating_star_off:Class = rating_star_off_png;
      
      public static var newnavigator_rating_star_on:Class = class_2787;
      
      public static var newnavigator_refresh_search_icon:Class = refresh_search_icon_png;
      
      public static var newnavigator_report_room:Class = class_2801;
      
      public static var newnavigator_room_settings_icon:Class = class_2813;
      
      public static var newnavigator_roominfo_temp:Class = class_2821;
      
      public static var newnavigator_roomusercount_dimmer_black:Class = roomusercount_dimmer_black_png;
      
      public static var poll_poll_prompt_frank:Class = poll_prompt_frank_png;
      
      public static var poll_poll_prompt_question:Class = poll_prompt_question_png;
      
      public static var pursearea_credits_icon:Class = credits_icon_png;
      
      public static var pursearea_credits_icon2:Class = credits_icon2_png;
      
      public static var pursearea_diamond_icon:Class = diamond_icon_png;
      
      public static var pursearea_duckets_icon:Class = class_2046;
      
      public static var pursearea_hc_icon:Class = class_2418;
      
      public static var pursearea_logout_icon:Class = logout_icon_png;
      
      public static var pursearea_loyalty_icon:Class = class_2595;
      
      public static var pursearea_settings_icon:Class = settings_icon_png;
      
      public static var pursearea_vault_icon:Class = class_3106;
      
      public static var vault_window_vault_opener:Class = class_2488;
      
      public static var vault_window_vault_open:Class = class_2487;
      
      public static var vault_window_vault_closed:Class = class_2486;
      
      public static var earnings_icon_achievements:Class = earnings_icon_achievements_png;
      
      public static var earnings_icon_bonusbag:Class = earnings_icon_bonusbag_png;
      
      public static var earnings_icon_dailygift:Class = earnings_icon_dailygift_png;
      
      public static var earnings_icon_donations:Class = earnings_icon_donations_png;
      
      public static var earnings_icon_hcpayday:Class = class_2048;
      
      public static var earnings_icon_levelprogression:Class = earnings_icon_levelprogression_png;
      
      public static var earnings_icon_marketplace:Class = earnings_icon_marketplace_png;
      
      public static var earnings_icon_roombundle:Class = class_2049;
      
      public static var earnings_icon_surprise:Class = class_2051;
      
      public static var earnings_icon_tutorial:Class = class_2052;
      
      public static var earnings_icon_snowstorm:Class = class_2050;
      
      public static var icon_present:Class = class_2479;
      
      public static var rarity_item_rarity_item_plaque:Class = rarity_item_plaque_png;
      
      public static var rarity_item_rarity_preview_bg:Class = class_2786;
      
      public static var relationship_status_bobba:Class = class_1804;
      
      public static var relationship_status_heart:Class = class_2429;
      
      public static var relationship_status_none:Class = class_2689;
      
      public static var relationship_status_smile:Class = smile_png;
      
      public static var roomtools_camera:Class = class_1877;
      
      public static var roomtools_chat_history:Class = chat_history_png;
      
      public static var roomtools_gear:Class = gear_png;
      
      public static var roomtools_history_back_bg:Class = history_back_bg_png;
      
      public static var roomtools_history_back_icon:Class = class_2433;
      
      public static var roomtools_history_forward_bg:Class = history_forward_bg_png;
      
      public static var roomtools_history_forward_icon:Class = history_forward_icon_png;
      
      public static var roomtools_history_open_bg:Class = history_open_bg_png;
      
      public static var roomtools_history_open_icon:Class = class_2434;
      
      public static var roomtools_like:Class = like_png;
      
      public static var roomtools_magnifier:Class = class_2596;
      
      public static var roomtools_minimizebutton:Class = minimizebutton_png;
      
      public static var roomtools_photo_icon:Class = class_2729;
      
      public static var roomtools_unlike:Class = class_3077;
      
      public static var talent_achieved_div:Class = class_1756;
      
      public static var talent_achieved_left:Class = class_1757;
      
      public static var talent_achieved_mid:Class = class_1758;
      
      public static var talent_achieved_right:Class = achieved_right_png;
      
      public static var talent_action_overlay:Class = class_1764;
      
      public static var talent_avatar_glow:Class = class_1784;
      
      public static var talent_check_mark_circle:Class = check_mark_circle_png;
      
      public static var talent_citizenship_accomplished:Class = citizenship_accomplished_png;
      
      public static var talent_helper_icon:Class = class_2477;
      
      public static var talent_locked_achievement:Class = class_2588;
      
      public static var talent_locked_stripe:Class = class_2589;
      
      public static var talent_mask_left:Class = class_2618;
      
      public static var talent_mask_right:Class = class_2619;
      
      public static var talent_progress_lower:Class = progress_lower_png;
      
      public static var talent_progress_upper:Class = progress_upper_png;
      
      public static var talent_register_cutout_character:Class = register_cutout_character_png;
      
      public static var talent_task_progress_bg:Class = task_progress_bg_png;
      
      public static var talent_task_progress_fg:Class = task_progress_fg_png;
      
      public static var talent_task_progress_left:Class = task_progress_left_png;
      
      public static var talent_task_progress_right:Class = class_2975;
      
      public static var talent_unachieved_div:Class = class_3072;
      
      public static var talent_unachieved_left:Class = class_3073;
      
      public static var talent_unachieved_mid:Class = class_3074;
      
      public static var talent_unachieved_right:Class = class_3075;
      
      public static var talent_vip_reward:Class = vip_reward_png;
      
      public static var toolbar_citizenship_icon:Class = citizenship_icon_png;
      
      public static var toolbar_credit_icon_0:Class = credit_icon_0_png;
      
      public static var toolbar_credit_icon_1:Class = credit_icon_1_png;
      
      public static var toolbar_credit_icon_2:Class = credit_icon_2_png;
      
      public static var toolbar_duckat_icon_0:Class = duckat_icon_0_png;
      
      public static var toolbar_duckat_icon_1:Class = duckat_icon_1_png;
      
      public static var toolbar_duckat_icon_2:Class = duckat_icon_2_png;
      
      public static var toolbar_hc_icon_0:Class = hc_icon_0_png;
      
      public static var toolbar_hc_icon_1:Class = hc_icon_1_png;
      
      public static var toolbar_hc_icon_2:Class = hc_icon_2_png;
      
      public static var toolbar_memenu_achievements_color:Class = achievements_color_png;
      
      public static var toolbar_memenu_achievements_white:Class = class_1760;
      
      public static var toolbar_memenu_clothes_color:Class = class_1991;
      
      public static var toolbar_memenu_clothes_white:Class = clothes_white_png;
      
      public static var toolbar_memenu_guide_color:Class = class_2302;
      
      public static var toolbar_memenu_guide_white:Class = class_2306;
      
      public static var toolbar_memenu_minimail_color:Class = minimail_color_png;
      
      public static var toolbar_memenu_minimail_white:Class = minimail_white_png;
      
      public static var toolbar_memenu_profile_color:Class = class_2760;
      
      public static var toolbar_memenu_profile_white:Class = profile_white_png;
      
      public static var toolbar_memenu_rooms_color:Class = rooms_color_png;
      
      public static var toolbar_memenu_rooms_white:Class = rooms_white_png;
      
      public static var toolbar_memenu_settings_color:Class = settings_color_png;
      
      public static var toolbar_memenu_settings_slider_base:Class = class_2886;
      
      public static var toolbar_memenu_settings_slider_button:Class = slider_button_png;
      
      public static var toolbar_memenu_settings_sounds_off_color:Class = class_2913;
      
      public static var toolbar_memenu_settings_sounds_off_white:Class = class_2914;
      
      public static var toolbar_memenu_settings_sounds_on_color:Class = sounds_on_color_png;
      
      public static var toolbar_memenu_settings_sounds_on_white:Class = class_2916;
      
      public static var toolbar_memenu_settings_white:Class = settings_white_png;
      
      public static var toolbar_memenu_talents_color:Class = talents_color_png;
      
      public static var toolbar_memenu_talents_white:Class = talents_white_png;
      
      public static var toolbar_offer_icon_0:Class = class_2701;
      
      public static var toolbar_offer_icon_1:Class = class_2702;
      
      public static var toolbar_offer_icon_2:Class = class_2703;
      
      public static var toolbar_room_icon_0:Class = room_icon_0_png;
      
      public static var toolbar_room_icon_1:Class = room_icon_1_png;
      
      public static var toolbar_room_icon_2:Class = room_icon_2_png;
      
      public static var tools_black_pixel:Class = class_1801;
      
      public static var tools_file_icon:Class = class_2090;
      
      public static var tools_folder_icon:Class = class_2092;
      
      public static var tools_tools_download_icon:Class = tools_download_icon_png;
      
      public static var unique_item_label_1:Class = class_2542;
      
      public static var unique_item_label_glass_shine:Class = class_2543;
      
      public static var unique_item_label_number_glyphs:Class = label_number_glyphs_png;
      
      public static var unique_item_label_plaque_border:Class = label_plaque_border_png;
      
      public static var unique_item_label_plaque_metal:Class = class_2544;
      
      public static var unique_item_label_studs:Class = class_2545;
      
      public static var unique_item_large_background_wide:Class = class_1788;
      
      public static var unique_item_large_glass_bottom:Class = class_2276;
      
      public static var unique_item_large_glass_mid:Class = class_2277;
      
      public static var unique_item_large_glass_shine:Class = glass_shine_png;
      
      public static var unique_item_large_glass_top:Class = glass_top_png;
      
      public static var unique_item_large_iron:Class = iron_png;
      
      public static var unique_item_large_na_button:Class = class_2667;
      
      public static var unique_item_large_na_button_wide:Class = class_2668;
      
      public static var unique_item_large_tile_upright:Class = class_3002;
      
      public static var unique_item_sold_out_label:Class = sold_out_label_png;
      
      public static var unique_item_sold_out_tile:Class = sold_out_tile_png;
      
      public static var word_quiz_thum_down:Class = thum_down_png;
      
      public static var word_quiz_thum_down_big:Class = class_2992;
      
      public static var word_quiz_thum_up:Class = class_2993;
      
      public static var word_quiz_thum_up_big:Class = thum_up_big_png;
      
      public static var avatar_image_xml:Class = avatar_image_xml;
      
      public static var badge_image_xml:Class = badge_image_xml;
      
      public static var balloon_xml:Class = class_1797;
      
      public static var clock_base_xml:Class = clock_base_xml;
      
      public static var hover_bitmap_xml:Class = class_2436;
      
      public static var illumina_border_xml:Class = class_2494;
      
      public static var illumina_chat_bubble_xml:Class = class_2495;
      
      public static var illumina_input_xml:Class = illumina_input_xml;
      
      public static var updating_timestamp_xml:Class = class_3079;
      
      public static var progress_indicator_xml:Class = progress_indicator_xml;
      
      public static var separator_xml:Class = separator_xml;
      
      public static var running_number_xml:Class = running_number_xml;
      
      public static var pet_image_xml:Class = pet_image_xml;
      
      public static var furniture_image_xml:Class = class_2122;
      
      public static var room_previewer_xml:Class = room_previewer_xml;
      
      public static var pixel_limit_xml:Class = pixel_limit_xml;
      
      public static var room_usercount_xml:Class = class_2818;
      
      public static var room_thumbnail_xml:Class = class_2814;
      
      public static var unique_item_overlay_griditem_xml:Class = unique_item_overlay_griditem_xml;
      
      public static var unique_item_overlay_supply_xml:Class = unique_item_overlay_supply_xml;
      
      public static var unique_item_overlay_preview_xml:Class = class_3076;
      
      public static var rarity_item_overlay_griditem_xml:Class = class_2785;
      
      public static var rarity_item_overlay_preview_xml:Class = rarity_item_overlay_preview_xml;
       
      
      public function HabboWindowManagerCom()
      {
         super();
      }
   }
}

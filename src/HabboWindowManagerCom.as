package
{
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import iid.IIDCoreWindowManager;
   import iid.IIDHabboWindowManager;
   import mx.core.SimpleApplication;
   
   public class HabboWindowManagerCom extends SimpleApplication
   {
      
      public static var manifest:Class = HabboWindowManagerCom_manifest;
      
      public static var habbo_element_description_xml:Class = HabboWindowManagerCom_habbo_element_description_xml;
      
      public static var habbo_window_layout_alert_xml:Class = HabboWindowManagerCom_habbo_window_layout_alert_xml;
      
      public static var habbo_window_layout_bubble_xml:Class = HabboWindowManagerCom_habbo_window_layout_bubble_xml;
      
      public static var habbo_window_layout_button_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_xml;
      
      public static var habbo_window_layout_button_thick_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_thick_xml;
      
      public static var habbo_window_layout_button_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_black_xml;
      
      public static var habbo_window_layout_button_thick_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_thick_black_xml;
      
      public static var habbo_window_layout_button_shiny_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_shiny_xml;
      
      public static var habbo_window_layout_button_shiny_thick_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_shiny_thick_xml;
      
      public static var habbo_window_layout_button_shiny_large_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_shiny_large_xml;
      
      public static var habbo_window_layout_button_shiny_large_5_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_shiny_large_5_xml;
      
      public static var habbo_window_layout_button_shiny_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_shiny_black_xml;
      
      public static var habbo_window_layout_button_shiny_thick_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_button_shiny_thick_black_xml;
      
      public static var habbo_window_layout_dropmenu_xml:Class = HabboWindowManagerCom_habbo_window_layout_dropmenu_xml;
      
      public static var habbo_window_layout_dropmenu_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_dropmenu_black_xml;
      
      public static var habbo_window_layout_dropmenu_item_xml:Class = HabboWindowManagerCom_habbo_window_layout_dropmenu_item_xml;
      
      public static var habbo_window_layout_dropmenu_item_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_dropmenu_item_black_xml;
      
      public static var habbo_window_layout_frame_xml:Class = HabboWindowManagerCom_habbo_window_layout_frame_xml;
      
      public static var habbo_window_layout_frame_3_xml:Class = HabboWindowManagerCom_habbo_window_layout_frame_3_xml;
      
      public static var habbo_window_layout_header_xml:Class = HabboWindowManagerCom_habbo_window_layout_header_xml;
      
      public static var habbo_window_layout_header_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_header_black_xml;
      
      public static var habbo_window_layout_header_3_xml:Class = HabboWindowManagerCom_habbo_window_layout_header_3_xml;
      
      public static var habbo_window_layout_scaler_xml:Class = HabboWindowManagerCom_habbo_window_layout_scaler_xml;
      
      public static var habbo_window_layout_scaler_3_xml:Class = HabboWindowManagerCom_habbo_window_layout_scaler_3_xml;
      
      public static var habbo_window_layout_scrollbar_horizontal_xml:Class = HabboWindowManagerCom_habbo_window_layout_scrollbar_horizontal_xml;
      
      public static var habbo_window_layout_scrollbar_vertical_xml:Class = HabboWindowManagerCom_habbo_window_layout_scrollbar_vertical_xml;
      
      public static var habbo_window_layout_scrollable_itemlist_vertical_xml:Class = HabboWindowManagerCom_habbo_window_layout_scrollable_itemlist_vertical_xml;
      
      public static var habbo_window_layout_simple_xml:Class = HabboWindowManagerCom_habbo_window_layout_simple_xml;
      
      public static var habbo_window_layout_tab_button_xml:Class = HabboWindowManagerCom_habbo_window_layout_tab_button_xml;
      
      public static var habbo_window_layout_tab_button_black_xml:Class = HabboWindowManagerCom_habbo_window_layout_tab_button_black_xml;
      
      public static var habbo_window_layout_tab_button_3_xml:Class = HabboWindowManagerCom_habbo_window_layout_tab_button_3_xml;
      
      public static var habbo_window_layout_tab_context_xml:Class = HabboWindowManagerCom_habbo_window_layout_tab_context_xml;
      
      public static var habbo_window_layout_tab_context_3_xml:Class = HabboWindowManagerCom_habbo_window_layout_tab_context_3_xml;
      
      public static var habbo_window_layout_tooltip_xml:Class = HabboWindowManagerCom_habbo_window_layout_tooltip_xml;
      
      public static var tablet_window_layout_button_xml:Class = HabboWindowManagerCom_tablet_window_layout_button_xml;
      
      public static var tablet_window_layout_button_thick_xml:Class = HabboWindowManagerCom_tablet_window_layout_button_thick_xml;
      
      public static var tablet_window_layout_tab_button_xml:Class = HabboWindowManagerCom_tablet_window_layout_tab_button_xml;
      
      public static var tablet_window_layout_tab_context_xml:Class = HabboWindowManagerCom_tablet_window_layout_tab_context_xml;
      
      public static var tablet_window_layout_dropmenu_xml:Class = HabboWindowManagerCom_tablet_window_layout_dropmenu_xml;
      
      public static var tablet_window_layout_dropmenu_item_xml:Class = HabboWindowManagerCom_tablet_window_layout_dropmenu_item_xml;
      
      public static var habbo_skin_frame_xml:Class = HabboWindowManagerCom_habbo_skin_frame_xml;
      
      public static var habbo_skin_frame_3_xml:Class = HabboWindowManagerCom_habbo_skin_frame_3_xml;
      
      public static var habbo_skin_bubble_xml:Class = HabboWindowManagerCom_habbo_skin_bubble_xml;
      
      public static var habbo_skin_bubble_pointer_up_xml:Class = HabboWindowManagerCom_habbo_skin_bubble_pointer_up_xml;
      
      public static var habbo_skin_bubble_pointer_right_xml:Class = HabboWindowManagerCom_habbo_skin_bubble_pointer_right_xml;
      
      public static var habbo_skin_bubble_pointer_down_xml:Class = HabboWindowManagerCom_habbo_skin_bubble_pointer_down_xml;
      
      public static var habbo_skin_bubble_pointer_left_xml:Class = HabboWindowManagerCom_habbo_skin_bubble_pointer_left_xml;
      
      public static var habbo_skin_button_default_xml:Class = HabboWindowManagerCom_habbo_skin_button_default_xml;
      
      public static var habbo_skin_button_default_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_default_black_xml;
      
      public static var habbo_skin_button_default_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_default_white_xml;
      
      public static var habbo_skin_button_shiny_default_xml:Class = HabboWindowManagerCom_habbo_skin_button_shiny_default_xml;
      
      public static var habbo_skin_button_shiny_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_shiny_black_xml;
      
      public static var habbo_skin_button_shiny_thick_xml:Class = HabboWindowManagerCom_habbo_skin_button_shiny_thick_xml;
      
      public static var habbo_skin_button_shiny_large_xml:Class = HabboWindowManagerCom_habbo_skin_button_shiny_large_xml;
      
      public static var habbo_skin_button_shiny_thick_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_shiny_thick_black_xml;
      
      public static var habbo_skin_button_thick_xml:Class = HabboWindowManagerCom_habbo_skin_button_thick_xml;
      
      public static var habbo_skin_button_thick_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_thick_black_xml;
      
      public static var habbo_skin_button_thick_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_thick_white_xml;
      
      public static var habbo_skin_button_group_left_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_left_xml;
      
      public static var habbo_skin_button_group_left_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_left_black_xml;
      
      public static var habbo_skin_button_group_left_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_left_white_xml;
      
      public static var habbo_skin_button_group_center_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_center_xml;
      
      public static var habbo_skin_button_group_center_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_center_black_xml;
      
      public static var habbo_skin_button_group_center_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_center_white_xml;
      
      public static var habbo_skin_button_group_right_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_right_xml;
      
      public static var habbo_skin_button_group_right_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_right_black_xml;
      
      public static var habbo_skin_button_group_right_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_group_right_white_xml;
      
      public static var habbo_skin_button_checkbox_xml:Class = HabboWindowManagerCom_habbo_skin_button_checkbox_xml;
      
      public static var habbo_skin_button_checkbox_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_checkbox_black_xml;
      
      public static var habbo_skin_button_checkbox_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_checkbox_white_xml;
      
      public static var habbo_skin_button_close_xml:Class = HabboWindowManagerCom_habbo_skin_button_close_xml;
      
      public static var habbo_skin_button_close_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_close_black_xml;
      
      public static var habbo_skin_button_close_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_close_white_xml;
      
      public static var habbo_skin_button_close_3_xml:Class = HabboWindowManagerCom_habbo_skin_button_close_3_xml;
      
      public static var habbo_skin_button_radio_xml:Class = HabboWindowManagerCom_habbo_skin_button_radio_xml;
      
      public static var habbo_skin_button_radio_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_radio_black_xml;
      
      public static var habbo_skin_button_radio_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_radio_white_xml;
      
      public static var habbo_skin_button_tab_xml:Class = HabboWindowManagerCom_habbo_skin_button_tab_xml;
      
      public static var habbo_skin_button_tab_black_xml:Class = HabboWindowManagerCom_habbo_skin_button_tab_black_xml;
      
      public static var habbo_skin_button_tab_white_xml:Class = HabboWindowManagerCom_habbo_skin_button_tab_white_xml;
      
      public static var habbo_skin_button_tab_3_xml:Class = HabboWindowManagerCom_habbo_skin_button_tab_3_xml;
      
      public static var habbo_skin_tab_content_3_xml:Class = HabboWindowManagerCom_habbo_skin_tab_content_3_xml;
      
      public static var habbo_skin_scaler_xml:Class = HabboWindowManagerCom_habbo_skin_scaler_xml;
      
      public static var habbo_skin_scaler_black_xml:Class = HabboWindowManagerCom_habbo_skin_scaler_black_xml;
      
      public static var habbo_skin_scaler_white_xml:Class = HabboWindowManagerCom_habbo_skin_scaler_white_xml;
      
      public static var habbo_skin_scaler_3_xml:Class = HabboWindowManagerCom_habbo_skin_scaler_3_xml;
      
      public static var habbo_skin_scrollbar_xml:Class = HabboWindowManagerCom_habbo_skin_scrollbar_xml;
      
      public static var habbo_skin_scrollbar_black_xml:Class = HabboWindowManagerCom_habbo_skin_scrollbar_black_xml;
      
      public static var habbo_skin_scrollbar_3_xml:Class = HabboWindowManagerCom_habbo_skin_scrollbar_3_xml;
      
      public static var habbo_skin_header_xml:Class = HabboWindowManagerCom_habbo_skin_header_xml;
      
      public static var habbo_skin_header_3_xml:Class = HabboWindowManagerCom_habbo_skin_header_3_xml;
      
      public static var habbo_skin_icon_set_xml:Class = HabboWindowManagerCom_habbo_skin_icon_set_xml;
      
      public static var habbo_skin_dropmenu_xml:Class = HabboWindowManagerCom_habbo_skin_dropmenu_xml;
      
      public static var habbo_skin_dropmenu_black_xml:Class = HabboWindowManagerCom_habbo_skin_dropmenu_black_xml;
      
      public static var habbo_skin_tab_context_xml:Class = HabboWindowManagerCom_habbo_skin_tab_context_xml;
      
      public static var habbo_skin_border_black_xml:Class = HabboWindowManagerCom_habbo_skin_border_black_xml;
      
      public static var habbo_skin_border_colorless_xml:Class = HabboWindowManagerCom_habbo_skin_border_colorless_xml;
      
      public static var habbo_skin_border_white_xml:Class = HabboWindowManagerCom_habbo_skin_border_white_xml;
      
      public static var habbo_skin_border_slot_xml:Class = HabboWindowManagerCom_habbo_skin_border_slot_xml;
      
      public static var habbo_skin_border_4_xml:Class = HabboWindowManagerCom_habbo_skin_border_4_xml;
      
      public static var habbo_skin_border_5_xml:Class = HabboWindowManagerCom_habbo_skin_border_5_xml;
      
      public static var habbo_skin_border_6_xml:Class = HabboWindowManagerCom_habbo_skin_border_6_xml;
      
      public static var habbo_skin_border_7_xml:Class = HabboWindowManagerCom_habbo_skin_border_7_xml;
      
      public static var habbo_skin_border_8_xml:Class = HabboWindowManagerCom_habbo_skin_border_8_xml;
      
      public static var habbo_skin_text_xml:Class = HabboWindowManagerCom_habbo_skin_text_xml;
      
      public static var habbo_skin_tooltip_xml:Class = HabboWindowManagerCom_habbo_skin_tooltip_xml;
      
      public static var text_styles_css:Class = HabboWindowManagerCom_text_styles_css;
      
      public static var habbo_bitmap_skin_png:Class = HabboWindowManagerCom_habbo_bitmap_skin_png;
      
      public static var habbo_bitmap_skin2_png:Class = HabboWindowManagerCom_habbo_bitmap_skin2_png;
      
      public static var habbo_cursor_link_png:Class = HabboWindowManagerCom_habbo_cursor_link_png;
      
      public static var habbo_cursor_drag_png:Class = HabboWindowManagerCom_habbo_cursor_drag_png;
      
      public static var habbo_icons_png:Class = HabboWindowManagerCom_habbo_icons_png;
      
      public static var volter:Class = HabboWindowManagerCom_volter;
      
      public static var volterb:Class = HabboWindowManagerCom_volterb;
      
      public static var ubuntu_regular:Class = HabboWindowManagerCom_ubuntu_regular;
      
      public static var ubuntu_bold:Class = HabboWindowManagerCom_ubuntu_bold;
      
      public static var ubuntu_italic:Class = HabboWindowManagerCom_ubuntu_italic;
      
      public static var ubuntu_bold_italic:Class = HabboWindowManagerCom_ubuntu_bold_italic;
      
      public static var habbo_window_alert_xml:Class = HabboWindowManagerCom_habbo_window_alert_xml;
      
      public static var habbo_window_alert_link_xml:Class = HabboWindowManagerCom_habbo_window_alert_link_xml;
      
      public static var habbo_window_confirm_xml:Class = HabboWindowManagerCom_habbo_window_confirm_xml;
      
      public static var habbo_crasher_dialog_xml:Class = HabboWindowManagerCom_habbo_crasher_dialog_xml;
      
      public static var IIDCoreWindowFrameworkLib:Class = IIDCoreWindowManager;
      
      public static var IIDHabboWindowFrameworkLib:Class = IIDHabboWindowManager;
      
      public static var ICoreLocalizationFrameworkLib:Class = ICoreLocalizationFrameworkLib;
      
      public static var ICoreWindowFrameworkLib:Class = ICoreWindowFrameworkLib;
      
      public static var CoreWindowFrameworkLib:Class = CoreWindowFrameworkLib;
      
      public static var HabboWindowManagerComponent:Class = HabboWindowManagerComponent;
       
      
      public function HabboWindowManagerCom()
      {
         super();
      }
   }
}

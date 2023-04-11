package
{
   import com.sulake.bootstrap.ModerationManagerBootstrap;
   import com.sulake.iid.IIDHabboModeration;
   import mx.core.SimpleApplication;

   public class HabboModerationCom extends SimpleApplication
   {
      
      public static var manifest:Class = manifest;
      
      public static var requiredClasses:Array = new Array(ModerationManagerBootstrap,IIDHabboModeration);
      
      public static var evidence_frame_xml:Class = evidence_frame;
      
      public static var issue_browser_xml:Class = class_2534;
      
      public static var modact_summary_xml:Class = modact_summary;
      
      public static var send_msgs_xml:Class = send_msgs_xml;
      
      public static var start_panel_xml:Class = start_panel;
      
      public static var user_info_xml:Class = user_info;
      
      public static var user_info_frame_xml:Class = user_info_frame;
      
      public static var issue_handler_xml:Class = issue_handler;
      
      public static var roomtool_frame_xml:Class = class_2823;
      
      public static var roomvisits_frame_xml:Class = roomvisits_frame;
      
      public static var userclassification_frame_xml:Class = userclassification_frame;
     
      public static var room_icon_png:Class = class_2809;
      
      public static var user_icon_png:Class = user_icon;
       
      
      public function HabboModerationCom()
      {
         super();
      }
   }
}

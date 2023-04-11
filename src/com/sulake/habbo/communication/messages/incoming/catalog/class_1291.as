package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1291
   {
       
      
      private var var_805:Boolean;
      
      private var _icon:int;
      
      private var var_344:int;
      
      private var _pageName:String;
      
      private var _localization:String;
      
      private var _children:Vector.<package_8.class_1291>;
      
      private var _offerIds:Vector.<int>;
      
      public function class_1291(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         super();
         var_805 = param1.readBoolean();
         _icon = param1.readInteger();
         var_344 = param1.readInteger();
         _pageName = param1.readString();
         _localization = param1.readString();
         _offerIds = new Vector.<int>(0);
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _offerIds.push(param1.readInteger());
            _loc3_++;
         }
         _children = new Vector.<package_8.class_1291>(0);
         var _loc4_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _children.push(new package_8.class_1291(param1));
            _loc3_++;
         }
      }
      
      public function get visible() : Boolean
      {
         return var_805;
      }
      
      public function get icon() : int
      {
         return _icon;
      }
      
      public function get pageId() : int
      {
         return var_344;
      }
      
      public function get pageName() : String
      {
         return _pageName;
      }
      
      public function get localization() : String
      {
         return _localization;
      }
      
      public function get children() : Vector.<package_8.class_1291>
      {
         return _children;
      }
      
      public function get offerIds() : Vector.<int>
      {
         return _offerIds;
      }
   }
}

package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1349 implements IMessageParser
   {
       
      
      private var var_351:String = null;
      
      private var var_371:String = null;
      
      private var var_558:String = null;
      
      private var var_521:String = null;
      
      public function class_1349()
      {
         super();
      }
      
      public function get floorType() : String
      {
         return var_351;
      }
      
      public function get wallType() : String
      {
         return var_371;
      }
      
      public function get landscapeType() : String
      {
         return var_558;
      }
      
      public function get animatedLandscapeType() : String
      {
         return var_521;
      }
      
      public function flush() : Boolean
      {
         var_351 = null;
         var_371 = null;
         var_558 = null;
         var_521 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:String = param1.readString();
         var _loc2_:String = param1.readString();
         switch(_loc3_)
         {
            case "floor":
               var_351 = _loc2_;
               break;
            case "wallpaper":
               var_371 = _loc2_;
               break;
            case "landscape":
               var_558 = _loc2_;
               break;
            case "landscapeanim":
               var_521 = _loc2_;
         }
         return true;
      }
   }
}

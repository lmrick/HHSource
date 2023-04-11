package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1222 implements IMessageParser
   {
       
      
      private var var_430:Boolean = false;
      
      private var var_267:Number = 1;
      
      private var var_187:Number = 1;
      
      public function class_1222()
      {
         super();
      }
      
      public function get wallsHidden() : Boolean
      {
         return var_430;
      }
      
      public function get wallThicknessMultiplier() : Number
      {
         return var_267;
      }
      
      public function get floorThicknessMultiplier() : Number
      {
         return var_187;
      }
      
      public function flush() : Boolean
      {
         var_430 = false;
         var_267 = 1;
         var_187 = 1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_430 = param1.readBoolean();
         var _loc3_:int = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         if(_loc3_ < -2)
         {
            _loc3_ = -2;
         }
         else if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         if(_loc2_ < -2)
         {
            _loc2_ = -2;
         }
         else if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         var_267 = Math.pow(2,_loc3_);
         var_187 = Math.pow(2,_loc2_);
         return true;
      }
   }
}

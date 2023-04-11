package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.room.utils.Vector3d;
   
   [SecureSWF(rename="true")]
   public class class_1379 implements IMessageParser
   {
       
      
      private var var_390:package_154.class_1648;
      
      private var _animationTime:Number;
      
      public function class_1379()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_390 = null;
         _animationTime = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:Number = param1.readInteger();
         var _loc3_:Number = param1.readInteger();
         var _loc9_:Number = param1.readInteger();
         var _loc7_:Number = param1.readInteger();
         var _loc4_:Number = Number(param1.readString());
         var _loc6_:Number = Number(param1.readString());
         var _loc5_:Number = param1.readInteger();
         var _loc8_:Number = param1.readInteger();
         var_390 = new package_154.class_1648(_loc5_,new Vector3d(_loc2_,_loc3_,_loc4_),new Vector3d(_loc9_,_loc7_,_loc6_),_loc8_ == 0 ? "mv" : "sld");
         _animationTime = param1.readInteger();
         return true;
      }
      
      public function get userMove() : package_154.class_1648
      {
         return var_390;
      }
      
      public function get animationTime() : int
      {
         return _animationTime;
      }
   }
}

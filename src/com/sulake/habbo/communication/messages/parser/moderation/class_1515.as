package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1515 implements IMessageParser
   {
       
      
      private var var_318:package_137.class_1612;
      
      public function class_1515()
      {
         super();
      }
      
      public function get issueData() : package_137.class_1612
      {
         return var_318;
      }
      
      public function flush() : Boolean
      {
         if(!var_318)
         {
         }
         var_318 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc7_:int = 0;
         var _loc3_:int = param1.readInteger();
         var _loc16_:int = param1.readInteger();
         var _loc19_:int = param1.readInteger();
         var _loc17_:int = param1.readInteger();
         var _loc4_:Number = param1.readInteger();
         var _loc8_:int = param1.readInteger();
         var _loc5_:int = param1.readInteger();
         var _loc18_:int = param1.readInteger();
         var _loc14_:String = param1.readString();
         var _loc15_:int = param1.readInteger();
         var _loc11_:String = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc13_:String = param1.readString();
         var _loc9_:String = param1.readString();
         var _loc10_:int = param1.readInteger();
         var _loc12_:int = param1.readInteger();
         var _loc6_:* = [];
         _loc7_ = 0;
         while(_loc7_ < _loc12_)
         {
            _loc6_.push(new class_1575(param1));
            _loc7_++;
         }
         var_318 = new package_137.class_1612(_loc3_,_loc16_,_loc19_,_loc17_,_loc4_,_loc8_,_loc5_,_loc18_,_loc14_,_loc15_,_loc11_,_loc2_,_loc13_,_loc9_,_loc10_,_loc6_);
         return true;
      }
   }
}

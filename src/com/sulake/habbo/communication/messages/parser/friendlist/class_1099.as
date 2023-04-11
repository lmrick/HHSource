package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_24.class_1546;
   import package_24.class_1599;
   
   [SecureSWF(rename="true")]
   public class class_1099 implements IMessageParser
   {
       
      
      private var var_803:Array;
      
      private var var_693:Array;
      
      private var var_1322:Array;
      
      private var var_977:Array;
      
      public function class_1099()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_803 = [];
         this.var_693 = [];
         this.var_1322 = [];
         this.var_977 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            this.var_803.push(new class_1546(param1));
            _loc5_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc6_ = param1.readInteger()) == -1)
            {
               _loc4_ = param1.readInteger();
               this.var_693.push(_loc4_);
            }
            else if(_loc6_ == 0)
            {
               this.var_977.push(new class_1599(param1));
            }
            else if(_loc6_ == 1)
            {
               this.var_1322.push(new class_1599(param1));
            }
            _loc5_++;
         }
         return true;
      }
      
      public function get cats() : Array
      {
         return this.var_803;
      }
      
      public function get removedFriendIds() : Array
      {
         return this.var_693;
      }
      
      public function get addedFriends() : Array
      {
         return this.var_1322;
      }
      
      public function get updatedFriends() : Array
      {
         return this.var_977;
      }
   }
}

package package_125
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_16.class_1595;
   
   [SecureSWF(rename="true")]
   public class class_1264 implements IMessageParser
   {
       
      
      private var var_401:int;
      
      private var var_280:Array;
      
      private var var_417:int;
      
      private var var_439:int;
      
      private var var_434:int;
      
      private var var_268:Array;
      
      private var var_404:int;
      
      private var var_565:int;
      
      public function class_1264()
      {
         super();
      }
      
      public function get firstUserID() : int
      {
         return var_401;
      }
      
      public function get firstUserItemArray() : Array
      {
         return var_280;
      }
      
      public function get firstUserNumItems() : int
      {
         return var_417;
      }
      
      public function get firstUserNumCredits() : int
      {
         return var_439;
      }
      
      public function get secondUserID() : int
      {
         return var_434;
      }
      
      public function get secondUserItemArray() : Array
      {
         return var_268;
      }
      
      public function get secondUserNumItems() : int
      {
         return var_404;
      }
      
      public function get secondUserNumCredits() : int
      {
         return var_565;
      }
      
      public function flush() : Boolean
      {
         var_401 = -1;
         var_280 = null;
         var_417 = 0;
         var_439 = 0;
         var_434 = -1;
         var_268 = null;
         var_404 = 0;
         var_565 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_401 = param1.readInteger();
         var_280 = [];
         if(!parseItemData(param1,var_280))
         {
            return false;
         }
         var_417 = param1.readInteger();
         var_439 = param1.readInteger();
         var_434 = param1.readInteger();
         var_268 = [];
         if(!parseItemData(param1,var_268))
         {
            return false;
         }
         var_404 = param1.readInteger();
         var_565 = param1.readInteger();
         return true;
      }
      
      private function parseItemData(param1:IMessageDataWrapper, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         _loc3_ = param1.readInteger();
         while(_loc3_ > 0)
         {
            param2.push(new class_1595(param1));
            _loc3_--;
         }
         return true;
      }
   }
}

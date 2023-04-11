package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_41.class_1576;
   import package_41.class_1596;
   
   [SecureSWF(rename="true")]
   public class class_1239 implements IMessageParser
   {
       
      
      private var var_440:int;
      
      private var _pet1:class_1576;
      
      private var _pet2:class_1576;
      
      private var var_498:Array;
      
      private var var_903:int;
      
      public function class_1239()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_440 = 0;
         if(_pet1)
         {
            _pet1.dispose();
            _pet1 = null;
         }
         if(_pet2)
         {
            _pet2.dispose();
            _pet2 = null;
         }
         for each(var _loc1_ in var_498)
         {
            _loc1_.dispose();
         }
         var_498 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_440 = param1.readInteger();
         _pet1 = new class_1576(param1);
         _pet2 = new class_1576(param1);
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_498.push(new class_1596(param1));
            _loc2_++;
         }
         var_903 = param1.readInteger();
         return true;
      }
      
      public function get nestId() : int
      {
         return var_440;
      }
      
      public function get pet1() : class_1576
      {
         return _pet1;
      }
      
      public function get pet2() : class_1576
      {
         return _pet2;
      }
      
      public function get rarityCategories() : Array
      {
         return var_498;
      }
      
      public function get resultPetType() : int
      {
         return var_903;
      }
   }
}

package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_78.class_1553;
   import package_78.class_1621;
   import package_78.class_1622;
   
   [SecureSWF(rename="true")]
   public class class_1053 implements IMessageParser
   {
       
      
      private var var_31:class_1553;
      
      public function class_1053()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_31 = new class_1553();
         var_31.roomId = param1.readInteger();
         var_31.name = param1.readString();
         var_31.description = param1.readString();
         var_31.doorMode = param1.readInteger();
         var_31.categoryId = param1.readInteger();
         var_31.maximumVisitors = param1.readInteger();
         var_31.maximumVisitorsLimit = param1.readInteger();
         var_31.tags = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_31.tags.push(param1.readString());
            _loc3_++;
         }
         var_31.tradeMode = param1.readInteger();
         var_31.allowPets = param1.readInteger() == 1;
         var_31.allowFoodConsume = param1.readInteger() == 1;
         var_31.allowWalkThrough = param1.readInteger() == 1;
         var_31.hideWalls = param1.readInteger() == 1;
         var_31.wallThickness = param1.readInteger();
         var_31.floorThickness = param1.readInteger();
         var_31.chatSettings = new class_1622(param1);
         var_31.allowNavigatorDynamicCats = param1.readBoolean();
         var_31.roomModerationSettings = new class_1621(param1);
         return true;
      }
      
      public function flush() : Boolean
      {
         var_31 = null;
         return true;
      }
      
      public function get data() : class_1553
      {
         return var_31;
      }
   }
}

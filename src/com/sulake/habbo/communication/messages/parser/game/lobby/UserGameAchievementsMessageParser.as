package package_173
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_176.class_1428;
   
   public class UserGameAchievementsMessageParser implements IMessageParser
   {
       
      
      private var var_512:int;
      
      private var var_246:class_1428;
      
      public function UserGameAchievementsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_512 = param1.readInteger();
         var_246 = new class_1428();
         var_246.parse(param1);
         return true;
      }
      
      public function get gameTypeId() : int
      {
         return var_512;
      }
      
      public function get achievements() : Array
      {
         return var_246.achievements;
      }
      
      public function get defaultCategory() : String
      {
         return var_246.defaultCategory;
      }
   }
}

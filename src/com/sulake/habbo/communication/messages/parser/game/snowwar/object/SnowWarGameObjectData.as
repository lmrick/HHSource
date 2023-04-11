package package_185
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class SnowWarGameObjectData
   {
      
      public static const const_37:int = 1;
      
      public static const const_392:int = 2;
      
      public static const const_278:int = 3;
      
      public static const const_44:int = 4;
      
      public static const const_238:int = 5;
       
      
      protected var var_255:Array;
      
      public function SnowWarGameObjectData(param1:int, param2:int)
      {
         var_255 = [];
         super();
         setVariable(0,param1);
         setVariable(1,param2);
      }
      
      public static function create(param1:int, param2:int) : SnowWarGameObjectData
      {
         switch(param1 - 1)
         {
            case 0:
               return new SnowballGameObjectData(param1,param2);
            case 1:
               return new TreeGameObjectData(param1,param2);
            case 2:
               return new SnowballPileGameObjectData(param1,param2);
            case 3:
               return new SnowballMachineGameObjectData(param1,param2);
            case 4:
               return new HumanGameObjectData(param1,param2);
            default:
               return null;
         }
      }
      
      public function get type() : int
      {
         return getVariable(0);
      }
      
      public function get id() : int
      {
         return getVariable(1);
      }
      
      public function getVariable(param1:int) : int
      {
         return var_255[param1];
      }
      
      protected function setVariable(param1:int, param2:int) : void
      {
         var_255[param1] = param2;
      }
      
      protected function parseVariables(param1:IMessageDataWrapper, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 2;
         while(_loc3_ < param2)
         {
            var_255.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
      }
   }
}

package package_184
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class MachineCreatesSnowballEventData extends SnowWarGameEventData
   {
       
      
      private var var_1131:int;
      
      public function MachineCreatesSnowballEventData(param1:int)
      {
         super(param1);
      }
      
      public function get snowBallMachineReference() : int
      {
         return var_1131;
      }
      
      override public function parse(param1:IMessageDataWrapper) : void
      {
         var_1131 = param1.readInteger();
      }
   }
}

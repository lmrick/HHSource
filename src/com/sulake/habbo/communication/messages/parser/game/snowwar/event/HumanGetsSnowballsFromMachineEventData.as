package package_184
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HumanGetsSnowballsFromMachineEventData extends SnowWarGameEventData
   {
       
      
      private var var_756:int;
      
      private var var_1131:int;
      
      public function HumanGetsSnowballsFromMachineEventData(param1:int)
      {
         super(param1);
      }
      
      public function get humanGameObjectId() : int
      {
         return var_756;
      }
      
      public function get snowBallMachineReference() : int
      {
         return var_1131;
      }
      
      override public function parse(param1:IMessageDataWrapper) : void
      {
         var_756 = param1.readInteger();
         var_1131 = param1.readInteger();
      }
   }
}

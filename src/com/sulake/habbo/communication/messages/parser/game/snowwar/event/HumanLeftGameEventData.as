package package_184
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HumanLeftGameEventData extends SnowWarGameEventData
   {
       
      
      private var var_756:int;
      
      public function HumanLeftGameEventData(param1:int)
      {
         super(param1);
      }
      
      public function get humanGameObjectId() : int
      {
         return var_756;
      }
      
      override public function parse(param1:IMessageDataWrapper) : void
      {
         var_756 = param1.readInteger();
      }
   }
}

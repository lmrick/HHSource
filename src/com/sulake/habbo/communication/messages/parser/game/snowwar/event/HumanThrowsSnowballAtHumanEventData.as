package package_184
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HumanThrowsSnowballAtHumanEventData extends SnowWarGameEventData
   {
       
      
      private var var_756:int;
      
      private var var_1262:int;
      
      private var var_810:int;
      
      public function HumanThrowsSnowballAtHumanEventData(param1:int)
      {
         super(param1);
      }
      
      public function get humanGameObjectId() : int
      {
         return var_756;
      }
      
      public function get targetHumanGameObjectId() : int
      {
         return var_1262;
      }
      
      public function get trajectory() : int
      {
         return var_810;
      }
      
      override public function parse(param1:IMessageDataWrapper) : void
      {
         var_756 = param1.readInteger();
         var_1262 = param1.readInteger();
         var_810 = param1.readInteger();
      }
   }
}

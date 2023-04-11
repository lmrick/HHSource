package package_184
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HumanThrowsSnowballAtPositionEventData extends SnowWarGameEventData
   {
       
      
      private var var_756:int;
      
      private var var_839:int;
      
      private var var_739:int;
      
      private var var_810:int;
      
      public function HumanThrowsSnowballAtPositionEventData(param1:int)
      {
         super(param1);
      }
      
      public function get humanGameObjectId() : int
      {
         return var_756;
      }
      
      public function get targetX() : int
      {
         return var_839;
      }
      
      public function get targetY() : int
      {
         return var_739;
      }
      
      public function get trajectory() : int
      {
         return var_810;
      }
      
      override public function parse(param1:IMessageDataWrapper) : void
      {
         var_756 = param1.readInteger();
         var_839 = param1.readInteger();
         var_739 = param1.readInteger();
         var_810 = param1.readInteger();
      }
   }
}

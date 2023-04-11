package package_185
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HumanGameObjectData extends SnowWarGameObjectData
   {
      
      public static const const_7:int = 19;
       
      
      private var _name:String;
      
      private var _mission:String;
      
      private var var_427:String;
      
      private var var_133:String;
      
      public function HumanGameObjectData(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get mission() : String
      {
         return _mission;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get sex() : String
      {
         return var_133;
      }
      
      override public function parse(param1:IMessageDataWrapper) : void
      {
         parseVariables(param1,19);
         _name = param1.readString();
         _mission = param1.readString();
         var_427 = param1.readString();
         var_133 = param1.readString();
         class_14.log("Parsed human game object data, variables:" + var_255);
      }
      
      public function get currentLocationX() : int
      {
         return getVariable(2);
      }
      
      public function get currentLocationY() : int
      {
         return getVariable(3);
      }
      
      public function get currentTileX() : int
      {
         return getVariable(4);
      }
      
      public function get currentTileY() : int
      {
         return getVariable(5);
      }
      
      public function get bodyDirection() : int
      {
         return getVariable(6);
      }
      
      public function get hitPoints() : int
      {
         return getVariable(7);
      }
      
      public function get snowBallCount() : int
      {
         return getVariable(8);
      }
      
      public function get isBot() : int
      {
         return getVariable(9);
      }
      
      public function get activityTimer() : int
      {
         return getVariable(10);
      }
      
      public function get activityState() : int
      {
         return getVariable(11);
      }
      
      public function get nextTileX() : int
      {
         return getVariable(12);
      }
      
      public function get nextTileY() : int
      {
         return getVariable(13);
      }
      
      public function get moveTargetX() : int
      {
         return getVariable(14);
      }
      
      public function get moveTargetY() : int
      {
         return getVariable(15);
      }
      
      public function get score() : int
      {
         return getVariable(16);
      }
      
      public function get team() : int
      {
         return getVariable(17);
      }
      
      public function get userId() : int
      {
         return getVariable(18);
      }
   }
}

package package_183
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1589
   {
       
      
      private var var_271:int;
      
      private var var_1000:int;
      
      private var var_1111:Boolean;
      
      private var var_230:String;
      
      private var var_194:String;
      
      private var _description:String;
      
      private var _roomName:String;
      
      public function class_1589(param1:IMessageDataWrapper)
      {
         super();
         var_271 = param1.readInteger();
         var_1000 = param1.readInteger();
         var_1111 = param1.readBoolean();
         switch(var_271)
         {
            case 0:
            case 2:
               var_230 = param1.readString();
               var_194 = param1.readString();
               return;
            case 1:
               var_230 = param1.readString();
               var_194 = param1.readString();
               _description = param1.readString();
               return;
            case 3:
               if(!isGuide)
               {
                  var_230 = param1.readString();
                  var_194 = param1.readString();
                  _roomName = param1.readString();
               }
               return;
            default:
               return;
         }
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get secondsAgo() : int
      {
         return var_1000;
      }
      
      public function get isGuide() : Boolean
      {
         return var_1111;
      }
      
      public function get otherPartyName() : String
      {
         return var_230;
      }
      
      public function get otherPartyFigure() : String
      {
         return var_194;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
   }
}

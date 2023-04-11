package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1572
   {
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_117:package_144.class_1552;
      
      private var var_262:int;
      
      public function class_1572(param1:IMessageDataWrapper)
      {
         super();
         var_247 = param1.readInteger();
         _name = param1.readString();
         var_117 = new package_144.class_1552(param1);
         var_262 = param1.readInteger();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get typeId() : int
      {
         return var_117.typeId;
      }
      
      public function get paletteId() : int
      {
         return var_117.paletteId;
      }
      
      public function get color() : String
      {
         return var_117.color;
      }
      
      public function get breedId() : int
      {
         return var_117.breedId;
      }
      
      public function get customPartCount() : int
      {
         return var_117.customPartCount;
      }
      
      public function get figureString() : String
      {
         return var_117.figureString;
      }
      
      public function get figureData() : package_144.class_1552
      {
         return var_117;
      }
      
      public function get level() : int
      {
         return var_262;
      }
   }
}

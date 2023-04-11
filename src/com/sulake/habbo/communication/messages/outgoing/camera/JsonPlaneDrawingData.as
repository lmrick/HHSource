package package_138
{

   public class JsonPlaneDrawingData
   {
       
      
      private var var_30:Number;
      
      private var var_590:Vector.<package_138.JsonPoint>;
      
      private var _color:uint;
      
      private var var_494:Array;
      
      private var var_1211:Boolean;
      
      private var var_583:Array;
      
      public function JsonPlaneDrawingData()
      {
         var_590 = new Vector.<package_138.JsonPoint>();
         var_494 = [];
         var_583 = [];
         super();
      }
      
      public function get z() : Number
      {
         return var_30;
      }
      
      public function set z(param1:Number) : void
      {
         var_30 = param1;
      }
      
      public function get cornerPoints() : Vector.<package_138.JsonPoint>
      {
         return var_590;
      }
      
      public function addCornerPoint(param1:int, param2:int) : void
      {
         var_590.push(new package_138.JsonPoint(param1,param2));
      }
      
      public function get masks() : Array
      {
         return var_494;
      }
      
      public function addMask(param1:JsonMaskDrawingData) : void
      {
         var_494.push(param1);
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function get bottomAligned() : Boolean
      {
         return var_1211;
      }
      
      public function setBottomAligned(param1:Boolean) : void
      {
         var_1211 = param1;
      }
      
      public function get texCols() : Array
      {
         return var_583;
      }
      
      public function addTexCol(param1:JsonTextureColumnData) : void
      {
         var_583.push(param1);
      }
   }
}

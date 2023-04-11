package package_138
{
  
   public class JsonTextureColumnData
   {
       
      
      private var var_625:Array;
      
      public function JsonTextureColumnData()
      {
         var_625 = [];
         super();
      }
      
      public function addAssetName(param1:String) : void
      {
         var_625.push(param1);
      }
      
      public function get assetNames() : Array
      {
         return var_625;
      }
   }
}

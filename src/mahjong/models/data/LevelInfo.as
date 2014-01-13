/**
 * Created by evgenyyurko on 1/6/14.
 */
package mahjong.models.data
{
import models.implementations.levels.LevelInfoBase;

public class LevelInfo extends LevelInfoBase
{
    /*
     * Fields
     */
    private var _grid3D:GridInfo;

    /*
     * Properties
     */
    public function get grid3D():GridInfo
    {
        return _grid3D;
    }

    /*
     * Methods
     */
    public function LevelInfo()
    {


        init();
    }

    private function init():void
    {

    }


    override public function serialize():Object
    {
        return super.serialize();
    }


    override public function deserialize(data:Object):void
    {
        var grid:GridInfo = new GridInfo;
        grid.deserialize(data);

        super.deserialize(data);
    }
}
}

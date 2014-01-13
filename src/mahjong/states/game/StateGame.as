/**
 * Created by evgenyyurko on 1/8/14.
 */
package mahjong.states.game
{
import mahjong.controllers.game.ControllerSceneGame;
import mahjong.states.EStateType;
import mahjong.states.base.StateMahjongBase;

public class StateGame extends StateMahjongBase
{
    /*
     * Fields
     */


    /*
     * Properties
     */
    public override function get type():String
    {
        return EStateType.EST_GAME;
    }

    /*
     * Methods
     */
    public function StateGame()
    {


        init();
    }

    private function init():void
    {

    }

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        this.controllerScene = new ControllerSceneGame();
    }


    override public function prepareLayerPopups():void
    {
        super.prepareLayerPopups();

        {//register popups

        }
    }

    override public function loadResources(onComplete:Function):void
    {
        onComplete();

//        controllerScene.view.loadContent(onComplete);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);
    }

    public override function onLoadingEnd():void
    {
        GameInfoBase.instance.managerGameBase.registerStateGame(this);

        super.onLoadingEnd();
    }

    /*
     * IDisposable
     */
    public override function cleanup():void
    {
        super.cleanup();
    }


}
}
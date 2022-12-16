/*  created by cyn#1234
    additional credits: ero, jujstme
    uses asl-help https://github.com/just-ero/asl-help/  */

state("Chop Goblins") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Chop Goblins";
    vars.Helper.LoadSceneManager = true;
}

init
{
  vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
  {
    vars.loadingScene = "LoadingScene";
    vars.museum = "Museum";
    vars.mainMenu = "MainMenu";
    vars.endGameScene = "EndGameScene";
    return true;
  });
}

update
{
    current.SceneName = vars.Helper.Scenes.Active.Name; 
}


start
{
    if(current.SceneName == vars.museum && old.SceneName != current.SceneName){
        return true;
    }
}

split
{
    if(current.SceneName == vars.loadingScene && current.SceneName != old.SceneName || current.SceneName == vars.endGameScene && current.SceneName != old.SceneName){
        return true;
    }
}

reset
{
    if(current.SceneName == vars.mainMenu && old.SceneName != vars.endGameScene){
        return true;
    }
}

isLoading
{
    if(current.SceneName == vars.loadingScene){
        return true;
    }

    if(current.SceneName != vars.loadingScene){
        return false;
    }
}

exit
{
    vars.Helper.Timer.Reset();
}


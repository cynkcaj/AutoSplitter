/*  created by cyn#1234
    additional credits: ero, jujstme
    uses asl-help https://github.com/just-ero/asl-help/  */

state("Chop Goblins") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Chop Goblins";
    vars.Helper.LoadSceneManager = true;
    
    vars.loadingScene = "LoadingScene";
    vars.museum = "Museum";
    vars.mainMenu = "MainMenu";
    vars.endGameScene = "EndGameScene";
}

init
{
  vars.Helper.TryLoad = (Func<dynamic, bool>)(mono => true);
}

update
{
    current.SceneName = vars.Helper.Scenes.Active.Name; 
}


start
{
    return current.SceneName == vars.museum && old.SceneName != current.SceneName;
}

split
{
    return current.SceneName != old.SceneName && (current.SceneName == vars.loadingScene || current.SceneName == vars.endGameScene);
}

reset
{
    return current.SceneName == vars.mainMenu && old.SceneName != vars.endGameScene;
}

isLoading
{
    return current.SceneName == vars.loadingScene;
}

exit
{
    vars.Helper.Dispose();
}

shutdown
{
    vars.Helper.Dispose();
}

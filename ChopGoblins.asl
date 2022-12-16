/*  created by cyn#1234
    additional credits: ero, jujstme
    uses asl-help https://github.com/just-ero/asl-help/  */

state("Chop Goblins") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Chop Goblins";
    vars.Helper.LoadSceneManager = true;
    settings.Add("museumLevel", true, "Start on Museum");
    settings.Add("streetsLevel", false, "Start on Streets");
    settings.Add("draculaLevel", false, "Start on Dracula's Castle");
    settings.Add("greeceLevel", false, "Start on Greece");
    settings.Add("futureLevel", false, "Start on The Future");
}

init
{
  vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
  {
      vars.loadingScene = "LoadingScene";
      vars.endGameScene= "EndGameScene";
      vars.mainMenu = "MainMenu";
      vars.museum = "Museum";
      vars.streets = "Streets";
      vars.dracula = "DraculaCastle";
      vars.greece = "Greece";
      vars.future = "Future";
      return true;
  });
}

update
{
    current.SceneName = vars.Helper.Scenes.Active.Name; 
}

start
{
    // not sure how to do this in a cleaner fashion, sorry!
    if (settings["museumLevel"])
    {
        return current.SceneName == vars.museum && old.SceneName != current.SceneName;
    }

    if (settings["streetsLevel"])
    {
        return current.SceneName == vars.streets && old.SceneName != current.SceneName;
    }

    if (settings["draculaLevel"])
    {
        return current.SceneName == vars.dracula && old.SceneName != current.SceneName;
    }

    if (settings["greeceLevel"])
    {
        return current.SceneName == vars.greece && old.SceneName != current.SceneName;
    }
    
    if (settings["futureLevel"])
    {
        return current.SceneName == vars.future && old.SceneName != current.SceneName;
    }
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
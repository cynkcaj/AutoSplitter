/*  created by cyn#1234
    additional credits: ero, jujstme
    uses asl-help https://github.com/just-ero/asl-help/  */

state("Chop Goblins") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Chop Goblins";
    vars.Helper.LoadSceneManager = true;
    settings.Add("museumLevel", true, "Museum");
    settings.Add("streetsLevel", true, "Streets");
    settings.Add("draculaLevel", true, "Dracula's Castle");
    settings.Add("greeceLevel", true, "Greece");
    settings.Add("futureLevel", true, "The Future");
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
    if (settings["museumLevel"])
    {
        if(current.SceneName == vars.museum && old.SceneName != current.SceneName)
        {
            return true;
        }
    }

    if (settings["streetsLevel"])
    {
        if(current.SceneName == vars.streets && old.SceneName != current.SceneName)
        {
            return true;
        }
    }

    if (settings["draculaLevel"])
    {
        if(current.SceneName == vars.dracula && old.SceneName != current.SceneName)
        {
            return true;
        }
    }

    if (settings["greeceLevel"])
    {
        if(current.SceneName == vars.greece && old.SceneName != current.SceneName)
        {
            return true;
        }
    }

    if (settings["futureLevel"])
    {
        if(current.SceneName == vars.future && old.SceneName != current.SceneName)
        {
            return true;
        }
    }
}

split
{
    if(current.SceneName == vars.loadingScene && current.SceneName != old.SceneName || current.SceneName == vars.endGameScene && current.SceneName != old.SceneName)
    {
        return true;
    }
}

reset
{
    if(current.SceneName == vars.mainMenu && old.SceneName != vars.endGameScene)
    {
        return true;
    }
}

isLoading
{
    if(current.SceneName == vars.loadingScene)
    {
        return true;
    }
    else
    {
        return false;
    }
}

exit
{
    vars.Helper.Dispose();
}

shutdown
{
    vars.Helper.Dispose();
}

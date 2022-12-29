/*  created by cyn#1234
    additional credits: ero, jujstme
    uses asl-help https://github.com/just-ero/asl-help/  */

state("Chop Goblins") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Chop Goblins";
    vars.Helper.LoadSceneManager = true;

    settings.Add("MuseumLevel", true, "Start on Museum");
    settings.Add("StreetsLevel", false, "Start on Streets");
    settings.Add("DraculaCastleLevel", false, "Start on Dracula's Castle");
    settings.Add("GreeceLevel", false, "Start on Greece");
    settings.Add("FutureLevel", false, "Start on The Future");

    vars.loadingScene = "LoadingScene";
    vars.endGameScene= "EndGameScene";
    vars.mainMenu = "MainMenu";
}

update
{
    current.SceneName = vars.Helper.Scenes.Active.Name;
}

start
{
    return old.SceneName != current.SceneName && settings[current.SceneName + "Level"];
}

split
{
    return old.SceneName != current.SceneName && (current.SceneName == vars.loadingScene || current.SceneName == vars.endGameScene);
}

reset
{
    return old.SceneName != vars.endGameScene && current.SceneName == vars.mainMenu;
}

isLoading
{
    return current.SceneName == vars.loadingScene;
}

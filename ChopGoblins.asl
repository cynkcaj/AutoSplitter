/*  created by cynkcaj
    additional credits: ero, jujstme
    uses asl-help https://github.com/just-ero/asl-help/  */

state("Chop Goblins") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Chop Goblins";
    vars.Helper.LoadSceneManager = true;

    settings.Add("MainLevels", true, "Main Levels");

    settings.Add("Museum", true, "Start on Museum", "MainLevels");
    settings.Add("Streets", false, "Start on Streets", "MainLevels");
    settings.Add("DraculaCastle", false, "Start on Dracula's Castle", "MainLevels");
    settings.Add("Greece", false, "Start on Greece", "MainLevels");
    settings.Add("Future", false, "Start on The Future", "MainLevels");

    settings.Add("RemixLevels", false, "Remix Levels");

    settings.Add("REMIX_Greece", false, "Start on Greece (Remix)", "RemixLevels");
    settings.Add("REMIX_Streets", false, "Start on Streets Remix", "RemixLevels");
    settings.Add("REMIX_Future", false, "Start on The Future (Remix)", "RemixLevels");
    settings.Add("REMIX_DraculaCastle", false, "Start on Dracula's Castle (Remix)", "RemixLevels");
    settings.Add("REMIX_Museum", false, "Start on Museum (Remix)", "RemixLevels");

    vars.loadingScene = "LoadingScene";
    vars.endGameScene = "EndGameScene";
    vars.mainMenu = "MainMenu";
}

update
{
    current.SceneName = vars.Helper.Scenes.Active.Name;
}

start
{
    return old.SceneName != current.SceneName && settings[current.SceneName];
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
    return current.SceneName == vars.loadingScene || current.SceneName == vars.endGameScene;
}

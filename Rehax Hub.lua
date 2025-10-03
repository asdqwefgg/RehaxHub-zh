--=============================--
-- 由 Telegram@AiWo6 汉化
-- 可随意而改但要标注
-- 倒卖全家死光光
--=============================--

getgenv().LibraryIs = "Obsidian" -- 或 "Linoria"

-- 翻译表
local Translations = {
    ["Rehax Hub"] = "Rehax Hub (🇨🇳)",
    ["No Footer"] = "Telegram@AiWo6",
    ["LocalPlayer"] = "玩家",
    ["Movement"] = "移动",
    ["Slider"] = "调整",
    ["Speed Boost"] = "速度",
    ["Speed"] = "速度",
    ["Noclip"] = "穿墙",
    ["Enable"] = "启用",
    ["Infinite"] = "无限",
    ["Jump"] = "跳跃",
    ["No Acceleration"] = "无加速",
    ["No Closet Exit Delay"] = "无柜子退出延迟",
    ["Fly"] = "飞行",
    ["Camera"] = "相机",
    ["Fullbright"] = "全亮",
    ["No Camera Shake"] = "无相机抖动",
    ["Third Person"] = "第三人称",
    ["Spectate Entity"] = "观察实体",
    ["FOV"] = "视野",
    ["Others"] = "其他",
    ["Instant Interacts"] = "瞬间交互",
    ["Disable"] = "禁用",
    ["Anti Lag"] = "防卡顿",
    ["No Cutscenes"] = "去除过场动画",
    ["Reset"] = "自杀",
    ["Play Again"] = "重开",
    ["Lobby"] = "退出",
    ["Revive"] = "复活",
    ["Notify Library Code"] = "通知图书馆密码",
    ["Items"] = "物品",
    ["Crucifixs"] = "十字架",
    ["LockPicks"] = "撬锁器",
    ["Shears"] = "剪刀",
    ["Automation"] = "自动",
    ["Auto"] = "自动",
    ["Auto Interact"] = "自动互动",
    ["Ignore List"] = "忽略列表",
    ["Auto Interact Interval"] = "自动交互间隔",
    ["Auto Heartbeat Minigame"] = "自动心跳游戏",
    ["Unlock Padlock Distance"] = "解锁挂锁距离",
    ["Automation Library Code"] = "自动解锁挂锁",
    ["Breaker Box"] = "配电箱",
    ["Closet"] = "柜子",
    ["Reach"] = "范围",
    ["Prompt Clip"] = "隔墙交互",
    ["Prompt Reach"] = "交互距离",
    ["Door"] = "范围",
    ["Door Reach Range"] = "开门范围调整",

    ["Exploits"] = "漏洞",
    ["Entitys"] = "实体",
    ["Entity"] = "实体",
    ["Anti"] = "反",
    ["Bypass"] = "绕过",
    ["Interval"] = "间隔",
    ["Godmode Dropdown"] = "无敌下拉菜单",
    ["Godmode Range"] = "无敌范围",
    ["God Mode"] = "无敌",
    ["Use Tools Anywhere"] = "可随处用工具",
    ["Anti Cheat Manipulation"] = "反作弊操作",

    ["Visuals"] = "视觉",
    ["Settings"] = "设置",
    ["Enable Show Distances"] = "显示距离",
    ["Transparent"] = "透明度",
    ["Transparency"] = "透明度",
    ["Cart"] = "矿车",
    ["Entities"] = "实体",
    ["Notifys"] = "通知",
    ["Door"] = "门",
    ["Key"] = "钥匙",
    ["Gate Lever"] = "门杆",
    ["Players"] = "玩家",
    ["Books"] = "书",
    ["Breaker"] = "断路器",
    ["Gold"] = "金子",

    ["Floor"] = "楼层",
    ["Entites"] = "实体",
    ["Nanner Banana"] = "香蕉",
    ["Seek-Obstructions"] = "Seek-障碍物",
    ["Modifiers"] = "修饰符",
    ["Anti Fog"] = "防雾",
    ["Timer Lever"] = "计时杆",

    ["Configuration"] = "配置",
    ["Themes"] = "主题",
    ["Background color"] = "背景颜色",
    ["Main color"] = "主色调",
    ["Accent color"] = "强调色",
    ["Outline color"] = "轮廓颜色",
    ["Font color"] = "字体颜色",
    ["Font Face"] = "字体",
    ["Theme list"] = "主题列表",
    ["Set as default"] = "设为默认",
    ["Reset default"] = "重置默认值",
    ["Custom theme name"] = "自定义主题名称",
    ["Create theme"] = "创建主题",
    ["Custom themes"] = "自定义主题",
    ["Load theme"] = "加载主题",
    ["Overwrite theme"] = "覆盖主题",
    ["Delete theme"] = "删除主题",
    ["Refresh list"] = "刷新列表",
    ["Unlocker"] = "解锁",
    ["Play Sound"] = "播放声音",
    ["Notify Side"] = "通知位置",
    ["Menu bind"] = "菜单绑定",
    ["Show Keybinds"] = "显示按键绑定",
    ["Custom Cursor"] = "自定义光标",
    ["Unload"] = "卸下",
    ["Delay Added"] = "延迟增加",
    ["Less Value More Freeze when opening door but faster processing things"] = "开门时数值更小导致冻结时间更长，但处理速度更快",
    ["Join"] = "加入",
    ["Credits"] = "致谢",
    ["Creator"] = "作者",
    ["Creator of API Support His Script"] = "API 的创建者，支持他的脚本",
    ["Config name"] = "配置名称",
    ["Create config"] = "创建配置",
    ["Config list"] = "配置列表",
    ["Load config"] = "加载配置",
    ["Overwrite config"] = "覆盖配置",
    ["Delete config"] = "删除配置",
    ["Set as autoload"] = "自动加载",
    ["Reset autoload"] = "重置自动加载",
    ["Current autoload config:"] = "当前自动加载配置:"
}

-- 按长度排序，保证长词优先
local keys = {}
for k in pairs(Translations) do
    table.insert(keys, k)
end
table.sort(
    keys,
    function(a, b)
        return #a > #b
    end
)

-- 替换函数（纯文本，不走正则）
local function safeReplace(text, old, new)
    local result = ""
    local start = 1
    while true do
        local i, j = string.find(text, old, start, true) -- plain = true
        if not i then
            result = result .. string.sub(text, start)
            break
        end
        result = result .. string.sub(text, start, i - 1) .. new
        start = j + 1
    end
    return result
end

-- 翻译函数
local function translateText(text)
    if not text or type(text) ~= "string" then
        return text
    end
    for _, k in ipairs(keys) do
        text = safeReplace(text, k, Translations[k])
    end
    return text
end

-- Hook UI 赋值
local oldNewIndex
oldNewIndex =
    hookmetamethod(
    game,
    "__newindex",
    function(self, key, value)
        if key == "Text" and type(value) == "string" then
            value = translateText(value)
        end
        return oldNewIndex(self, key, value)
    end
)

-- 最后加载远程脚本
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheHunterSolo1/Scripts/main/Script'))()
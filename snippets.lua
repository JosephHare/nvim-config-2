local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

local js_snippets = {
    s("log1", { -- console.log(`var=${var}`);
        t("console.log(`"),
        i(1, "var"), t("=${"), rep(1), t("}`);"),
    }),
    s("log2", { -- console.log(`var1=${var1}, var2=${var2}`);
        t("console.log(`"),
        i(1, "var1"), t("=${"), rep(1), t("}, "),
        i(2, "var2"), t("=${"), rep(2), t("}`);"),
    }),
    s("log3", { -- console.log(`var1=${var1}, var2=${var2}, var3=${var3}`);
        t("console.log(`"),
        i(1, "var1"), t("=${"), rep(1), t("}, "),
        i(2, "var2"), t("=${"), rep(2), t("}, "),
        i(3, "var3"), t("=${"), rep(3), t("}`);"),
    }),
    s("logO1", { -- console.log("var=%O", var);
        t("console.log(\""),
        i(1, "var"), t("=%O\", "), rep(1),
        t(");"),
    }),
}

luasnip.add_snippets("javascript", js_snippets)

luasnip.add_snippets("cpp", {
    s("cote", { -- std::cout << msg << std::endl;
        t("std::cout << "), i(1, "msg"), t(" << std::endl;"),
    }),
})

# Dart 使用 Prettier 进行格式化

- 安装插件 `Prettier - Code formatter`

- 配置`.prettierrc` 文件

```json
{
  "printWidth": 100, // 最大宽度
  "tabWidth": 2, // 制表符宽度
  "useTabs": false, // 使用空格代替制表符
  "semi": true, // 分号
  "singleQuote": true, // 单引号
  "trailingComma": "all", // 尾随逗号
  "bracketSpacing": true, // 大括号空格
  "arrowParens": "avoid", // 箭头函数参数空格
  "bracketSameLine": false, // 结束括号单独占一行
  "proseWrap": "always", // 换行
  "htmlWhitespaceSensitivity": "css", // HTML 空格敏感度
  "endOfLine": "lf", // 行尾
  "embeddedLanguageFormatting": "auto", // 嵌入语言格式化
  "singleAttributePerLine": true // 每个属性独占一行
}
```

- 在`pubspec.yaml` 文件中添加一些 Dart 特定的格式化规则

```yaml
analyzer: # 分析器配置
  strong-mode: true # 强类型模式
  language: # 语言配置
    strict-raw-types: true # 严格原始类型
  errors: # 错误配置
    missing_return: error # 缺少返回值
    missing_required_param: error # 缺少必需参数
    invalid_assignment: error # 无效的赋值
    invalid_annotation_target: ignore # 无效的注解目标

dart_style:
  line_length: 100 # 设置最大行宽为 120 字符
```

- 在`.vscode/settings.json` 添加配置

```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [100],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": "off",
    "editor.defaultFormatter": "Dart-Code.dart-code",
    "editor.codeActionsOnSave": {
      "source.fixAll": "explicit",
      "source.organizeImports": "explicit"
    }
  },
  "dart.lineLength": 100,
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "editor.wordWrap": "wordWrapColumn",
  "editor.wordWrapColumn": 100
}
```

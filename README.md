# 2024新版斗鱼直播改造学习

技术栈使用：

- 状态管理使用：BLoc
- 路由管理使用： go_router
- 屏幕适配: flutter_screenutil


## 调试项目

- 关闭调试模式：debugShowCheckedModeBanner: false
- `flutter run` 运行项目 在终端按下小写`r` 触发热重载 大写`R` 热重启初始化状态

## 项目结构

例如：
1. blocs 文件夹 这是存放所有 BLoC 相关文件的地方。每个业务模块（例如 auth, user）应该有一个子文件夹，包含以下文件：
  - `auth_bloc.dart`：BLoC 的主体文件，负责接收事件并输出状态。
  - `auth_event.dart`：定义所有可能的事件类型，通常是用户触发的行为（例如登录请求）。
  - `auth_state.dart`：定义所有可能的状态，通常是响应事件后的结果（例如用户登录成功、失败、加载状态等）。


2. data 文件夹
  这一部分主要与数据的获取和处理相关，通常包含模型、仓库、数据源等：
  - `models/`：存放应用的数据模型（例如 user.dart）。
  - `repositories/`：存放与业务逻辑相关的仓库，负责从不同数据源获取数据（例如 auth_repository.dart、user_repository.dart）。
  - `sources/`：存放数据源相关代码，通常是与 API、数据库等交互的代码（例如 remote_data_source.dart、local_data_source.dart）。


3. ui 文件夹这一部分负责所有与用户界面（UI）相关的内容：
  - screens/：每个界面页面对应的文件（例如 login_screen.dart、user_profile_screen.dart）。
  - widgets/：可重用的 UI 组件（例如 user_tile.dart、custom_button.dart）。
  - themes/：应用的主题、样式相关文件（例如 app_theme.dart）。

4. services 文件夹这一部分通常存放与外部服务进行交互的代码，如 API 服务、身份验证服务等：

  - `api_service.dart`：用于处理与服务器的通信。
  - `authentication_service.dart`：处理登录、注册等用户认证逻辑。

5. routes 文件夹这一部分负责路由管理,避免路由管理散落分离。

  - `app_router.dart`: 路由配置入口
  - `route_paths.dart`: 路由路径常量
  - `route_guards.dart`: 路由守卫


6. `main.dart`: 入口文件，通常负责设置 App 的根部组件、主题、路由等。

下面是一个项目结构示例：
```bash
lib/
├── blocs/
│   ├── auth/
│   │   ├── auth_bloc.dart
│   │   ├── auth_event.dart
│   │   └── auth_state.dart
│   ├── user/
│   │   ├── user_bloc.dart
│   │   ├── user_event.dart
│   │   └── user_state.dart
│   └── common/
│       ├── loading_bloc.dart
│       └── error_bloc.dart
├── data/
│   ├── models/
│   │   └── user.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   └── user_repository.dart
│   └── sources/
│       ├── remote_data_source.dart
│       └── local_data_source.dart
├── ui/
│   ├── screens/
│   │   ├── login_screen.dart
│   │   └── user_profile_screen.dart
│   ├── widgets/
│   │   ├── user_tile.dart
│   │   └── custom_button.dart
│   └── themes/
│       └── app_theme.dart
├── services/
│   ├── api_service.dart
│   └── authentication_service.dart
└── main.dart
```



## Bloc 使用

- 文档：(https://bloclibrary.dev/#/fluttercubit)
- 使用依赖注入：通过如 get_it 等工具，将 BLoC 和服务类注入到界面中，便于管理依赖并提高代码可测试性。
- BLoC 组合模式：对于复杂的功能模块，可以将多个 BLoC 组合在一起，以简化管理。
- 避免过多的嵌套 BLoC：尽量避免将 BLoC 层级嵌套得过深，否则会增加理解和维护的难度。
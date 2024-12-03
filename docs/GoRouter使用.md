# GoRouter

go_router 是一个功能强大且灵活的路由管理库，支持：

- 嵌套路由
- 动态路径参数
- 深层链接
- Redirect 和守卫


## 安装依赖


```yaml
dependencies:
  go_router: ^14.0.0
```



## 目录结构


```bash
lib/
├── routes/
│   ├── app_router.dart      # 路由配置入口
│   ├── route_paths.dart     # 路由路径常量
│   └── route_guards.dart    # 路由守卫
├── ui/
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── login_screen.dart
│   │   └── user_details_screen.dart
└── main.dart
```



## 路由实现


### 1. 定义路径常量


在 `route_paths.dart` 中定义路由路径常量。

```dart
class RoutePaths {
  static const String home = '/';
  static const String login = '/login';
  static const String userDetails = '/user/:id';
}

```


### 2. 配置路由


在 `app_router.dart` 中定义路由规则。

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/login_screen.dart';
import '../ui/screens/user_details_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.home,
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.userDetails,
      builder: (context, state) {
        final id = state.params['id'];
        return UserDetailsScreen(userId: id!);
      },
    ),
  ],
);

```


### 3. 添加路由守卫

在 route_guards.dart 中实现守卫逻辑。

```dart
import 'package:go_router/go_router.dart';
import '../services/authentication_service.dart';

bool isAuthenticated = false; // 示例状态

final redirectLogic = GoRouterRedirect(
  (context, state) {
    if (!isAuthenticated && state.subloc != RoutePaths.login) {
      return RoutePaths.login;
    }
    return null; // 保持当前路径
  },
);

```

在 `app_router.dart` 中应用守卫：

```dart
final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.home,
  redirect: redirectLogic.redirect,
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => HomeScreen(),
    ),
    // 其他路由
  ],
);

```


### 4. 主入口整合

在 main.dart 中初始化路由。

```dart
import 'package:flutter/material.dart';
import 'routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

```



## 高级功能


### 动态参数解析


通过 `state.params` 获取动态参数：

```dart
GoRoute(
  path: '/user/:id',
  builder: (context, state) {
    final userId = state.params['id'];
    return UserDetailsScreen(userId: userId!);
  },
);

```


### 嵌套路由

支持子路由定义：
```dart
GoRoute(
  path: '/dashboard',
  builder: (context, state) => DashboardScreen(),
  routes: [
    GoRoute(
      path: 'settings',
      builder: (context, state) => SettingsScreen(),
    ),
  ],
);

```

导航到嵌套路由：

```dart
context.go('/dashboard/settings');
```

### 深层链接支持

使用 initialLocation 和 state 支持深层链接。



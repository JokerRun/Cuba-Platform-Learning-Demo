# CUBA Studio 用户向导

## [前言](https://doc.cuba-platform.cn/studio-chs/#preface)

本手册提供了 CUBA Studio IDE 以及其功能的参考信息，CUBA Studio IDE 有助于提高基于 CUBA 框架的应用程序的开发效率。

CUBA Studio 基于开源的 [IntelliJ IDEA Platform](https://www.jetbrains.com/opensource/idea/)，并通过以下 CUBA 特有的功能对其进行扩展：

- 创建 Gradle 构建脚本的脚手架代码。
- 创建数据模型、数据库架构和 CRUD UI 的脚手架代码。
- WYSIWYG 界面布局设计工具。
- 对开发人员友好的功能，加快编码过程，包括：动作(action) 、 推断(intention) 、 检查(inspection)、 引用(reference)。
- 轻松支持国际化。
- 为现有的（或遗留的）数据库创建数据模型和 UI 界面。
- 热（重新）部署。
- 使用 CUBA 框架和扩展的版本升级更加容易。

## [发行说明](https://doc.cuba-platform.cn/studio-chs/#release_notes)

- 版本 9

  **破坏性更改**：Studio 现在使用 HSQL 2.4.1。当打开一个使用 HSQL 数据库的项目时，Studio 会提示升级项目文件 `build.gradle` 中的 HSQL 版本。如果同意，项目可以正确的用 Studio v.9+ 继续工作。但是，要注意以下问题：带有新 HSQL 驱动的应用程序如果在带有旧 HSQL 驱动的之前版本 Studio 打开的话，有可能启动不了。基于 CUBA 7.1 之前的使用 HSQL 的项目，计划任务会失效，因为之前版本的数据库表有一列叫 `PERIOD`，现在在 HSQL 2.4.1 中已经是保留字了。在 CUBA 7.1 里面重命名了该列。热部署机制现在能同时部署更改的类依赖的所有类，这样不会在打开修改了的界面时弹出 `ClassCastException`。当选择 MySQL 或者 Oracle 数据库时，Studio 会展示一个对话框，这里可以点击链接到供应商网站下载 JDBC 驱动，然后可以上传驱动至项目和 Studio。上传驱动结束后，需要重启 Studio。可以使用 **CUBA > Database Proprietary Drivers** 配置页移除上传的驱动。在 **Create CUBA Screen** 向导中可以在浏览界面和主从界面模板的 **Table type** 字段选择 `DataGrid` 和 `TreeDataGrid`。在 **Create CUBA Screen** 向导 添加了 **Extend an existing screen** 和 **Entity fragment** 模板。在可视化编辑器中 Undo/Redo 操作能正常工作。在界面设计器中，数据加载器的查询语句添加了自动完成功能。界面设计器在画布右上角添加了一个按钮，用来切换至界面控制器。在基于新 API 的界面 XML 描述中使用 `invoke` 和 `datasource` 属性时，会给出警告。如果在 **Project Properties** 窗口添加了 Groovy 支持，则可以在 **Create CUBA Screen** 向导中的 **Advanced > Controller language** 字段选择 Groovy。Groovy 写的 Services 能在 CUBA 项目树中显示。项目打开时会弹出有框架新版本的提示。微调了代码编辑器中侧边栏的图标。不管有没有重构，都可以在实体设计界面自由更改实体属性的类型。添加了枚举类型设计界面。视图设计器使用原生 IntelliJ UI 重写。数据模型生成器包含使用新 API 的界面模板。所有解决了的问题：[Studio 9.0 解决的问题](https://youtrack.cuba-platform.com/issues/STUDIO?q=Milestone: {Release 9} State: Fixed,Verified)

- 版本 8

  现在第一次打开项目是通过导入向导来做了。参阅[打开现有项目](https://doc.cuba-platform.cn/studio-chs/#open_project)了解细节。项目模型现在保存在 `.idea` 文件夹的一个文件内，所以不会每次在打开项目时进行 Gradle 同步。通过 **Run/Debug Configuration** 编辑器现在可以选择运行应用程序服务的 JDK 版本。在 **Configuration** 标签页有 **JVM** 字段。默认使用 `JAVA_HOME` 环境变量的值。可以通过标准的 **Refactor > Rename** 操作来对视图进行重命名。在 CUBA 项目树中可以在视图元素上调用这个操作，也可以在 `views.xml` 文件的视图 XML 定义中的 `name` 属性调用这个操作或者在界面 XML 描述中任何引用该视图的地方调用。可以在界面设计器中数据容器的 **view** 字段调用视图编辑器。实现了在界面描述的 `` XML 元素中对 `screen` 属性的自动完成功能以及使用参考功能。为菜单标题实现了本地化名称编辑器。在 CUBA 项目树中点击 **Generic UI > Web Menu**，切换到 **Structure** 标签页，选择一个菜单项然后在 **Caption** 字段点击 **edit** 即可。如果枚举值没有本地化名称，编辑器则会出现警告。如果发现该警告，可以使用 **Create message in the message bundle** 快速修复来创建默认名称。实现了在配置接口中声明应用程序属性时，能自动完成其名称。当定义 `app.properties` 或 `web-app.properties` 内的属性时，按下 Ctrl+Space 即可。所有解决了的问题：[Studio 8.2 解决的问题](https://youtrack.cuba-platform.com/issues/STUDIO?q=Fixed in builds: 8.2.*)[Studio 8.0-8.1 解决的问题](https://youtrack.cuba-platform.com/issues/STUDIO?q=Fixed in builds: 8.0.* Fixed in builds: 8.1.*)

- 版本 7

  如果你的项目基于 CUBA 6.10 ，并使用了 BPM 、图表 、全文搜索或报表等高级扩展组件，则需要在 `~/.gradle/gradle.properties` 文件中设置 premium 仓库的访问凭据，如 [开发人员手册](https://doc.cuba-platform.com/manual-7.0-chs/access_to_repo.html#access_to_premium_repo)所述。 Studio不会将凭据传递给Gradle。所有解决了的问题：[Studio 7.3-7.4 解决的问题](https://youtrack.cuba-platform.com/issues/STUDIO?q=Fixed in builds: 7.3.* Fixed in builds: 7.4.*)[Studio 7.2 解决的问题](https://youtrack.cuba-platform.com/issues/STUDIO?q=Milestone: {Release 7} State: Fixed, Verified Fix versions: 7.2 Affected versions: -SNAPSHOT sort by: created asc)[Studio 7.0-7.1 解决的问题](https://youtrack.cuba-platform.com/issues/STUDIO?q=Milestone: {Release 7} State: Fixed, Verified Fix versions: 7.0 Fix versions: 7.1 Affected versions: -SNAPSHOT sort by: created asc)

## [1. 安装](https://doc.cuba-platform.cn/studio-chs/#installation)

在安装 CUBA Studio 之前，确保系统满足 CUBA 开发人员手册 [安装](https://doc.cuba-platform.com/manual-7.0-chs/setup.html) 部分中说明的要求。

有两种不同的安装 CUBA Studio 的形式：作为操作系统上独立的 IDE 安装或者作为已经安装的 IntelliJ IDEA 的插件安装。独立的 Studio IDE 是 IntelliJ IDEA 社区版的特殊版本，包含了 CUBA 插件。如果之前没有用过 IntelliJ IDEA，推荐使用独立 IDE 版本。

IDE 版本对应于使用的 IntelliJ IDEA 的版本，比如，2018.3。CUBA 插件有自己独立的版本号，从 9 开始。

可以从 https://www.cuba-platform.com/download 下载适用于 Windows、macOS 和 Linux 的独立 IDE 的安装程序。插件可以通过 IntelliJ 插件仓库下载（参考[下面](https://doc.cuba-platform.cn/studio-chs/#install_plugin)）。

- 在 Windows 上安装

  下载 `cuba-studio-VERSION.exe` 安装程序。运行安装程序并按照其说明操作：选择安装位置、启动器类型、文件夹名称，然后完成安装。启动已安装的应用程序，参考[这里](https://doc.cuba-platform.cn/studio-chs/#first_launch)了解更多信息。

- 在 macOS 上安装

  下载 `cuba-studio-VERSION.dmg` 安装程序。双击安装程序，然后将 `CUBA Studio.app` 拖放到 `Applications` 文件夹。如果有以前版本的 Studio 并且想保留它，请在出现的对话框中选择 *Keep Both*。启动 CUBA Studio 应用程序，参阅[这里](https://doc.cuba-platform.cn/studio-chs/#first_launch)了解更多信息。

- 在 Linux 上安装

  安装所需的依赖：`$ sudo apt-get install libgconf-2-4`下载 `cuba-studio-VERSION.tar.gz` 存档。将存档移动到适当的文件夹，例如 `~/lib` 并将其解压：`$ tar -xvf cuba-studio-VERSION.tar.gz`转到 `bin` 目录并启动应用程序：`$ cd ~/lib/cuba-studio-VERSION/bin $ ./cuba-studio.sh`

- 首次启动 IDE

  当第一次启动独立的 CUBA Studio IDE，Studio 会询问一些问题：在第一个 **Complete Installation** 对话框中，选择 **Do not import settings** 然后点击 **OK**。在下一个 **Customize CUBA Studio** 对话框中，可以点击 **Skip Remaining and Set Defaults** 以使用默认设置。因为之后随时可以自定义这些环境。参阅 [入门](https://doc.cuba-platform.cn/studio-chs/#getting_started) 部分了解如何启动一个新项目或者打开已有项目。

- IntelliJ IDEA 插件安装

  启动 IntelliJ IDEA 2018.3 或者更新版本。打开 **Plugins** 对话框。点击“齿轮”图标并选择 **Manage Plugin Repositories**。点击 **Add** 并在 **Repository URL** 字段输入以下内容：`https://plugins.jetbrains.com/plugins/haulmont/list`添加完仓库之后，切换到 **Marketplace** 标签页。在搜索框输入以下内容：`repository:"https://plugins.jetbrains.com/plugins/haulmont/list"`能在搜索结果中看到 CUBA 插件。点击 **Install** ，之后按照 IDE 的步骤继续安装。

## [2. 更新](https://doc.cuba-platform.cn/studio-chs/#update)

- 更新独立 IDE

  可以从 [网站](https://www.cuba-platform.com/download) 下载新版的独立 Studio IDE 然后覆盖安装。会保留之前所有的 Studio 设置。也可以从插件仓库安装 CUBA 插件的自动更新，这样就不用下载和安装整个 IDE 应用程序：打开 **Plugins** 对话框。点击 “齿轮” 图标并选中 **Manage Plugin Repositories**。点击 **Add** 然后在 **Repository URL** 字段输入下列内容：`https://plugins.jetbrains.com/plugins/haulmont/list`添加这个仓库后，切换到 **Updates** 标签页。如果有可用的更新，就可以在列表中看到。点击 CUBA 插件的 **Update** ，IDE 将会下载这个插件。下载完成后，需要重启 IDE 来应用新版的插件。

- 更新 IntelliJ IDEA 插件

  Windows 和 Linux 操作系统上点击 **Help > Check for Update**，MacOS 上点击 **IntelliJ IDEA > Check for Updates**。如果有可用的更新，会在列表中看到。选择 CUBA 插件 然后点击 **Update** 。IDE 将下载这个插件。下载完成后，需要重启 IDE 来应用新版的插件。

## [3. 入门](https://doc.cuba-platform.cn/studio-chs/#getting_started)

本节介绍如何在 Studio 中创建新项目或打开现有项目并启动应用程序。

### [3.1. 创建一个新项目](https://doc.cuba-platform.cn/studio-chs/#create_project)

CUBA Studio 提供了一种从零开始创建新 CUBA 项目的简单方法。只需使用 **New Project** 向导，然后按照以下步骤操作：

1. 在 **Welcome to CUBA Studio** 窗口中，单击 **Create New Project**.。
2. 选择 **CUBA Project**.
3. 在 **Project SDK** 字段，选择对应环境中设置 `JAVA_HOME` 的 JDK。如果看到 `` 这样的值，点击 **New** 然后选择 JDK 安装的目录，比如在 Windows 是 `C:\Java\jdk8u202-b08`，macOS 是 `/Library/Java/JavaVirtualMachines/jdk8u202-b08/Contents/Home`。
4. 选择默认仓库配置，或为项目 [自定义](https://doc.cuba-platform.com/manual-7.0-chs/access_to_repo.html) 仓库配置，然后单击 **Next**。
5. 在 **Project name** 字段中指定新项目的名称。名称应仅包含拉丁字母、数字和下划线。在此阶段需要仔细考虑项目名称，因为后续更改项目名将需要复杂的手工操作。
6. 以下字段将自动填充：
   - **Project location** – 新项目的路径。可以在字段中输入另一个目录或单击该字段旁边的省略号按钮来选择另一个目录。
   - **Project namespace** – 命名空间将用作实体名称和数据库表的前缀。命名空间只能由拉丁字母组成，并且应尽可能短。
   - **Root package** − Java 类的根（或基础）包。随后可以调整根包路径，但项目创建时生成的类不会自动更改。
   - **Platform version** – 项目使用的平台版本。如果没有特别的需求，使用最新的版本即可，比如，不带 `BETA` 或者 `SNAPSHOT` 后缀的版本。在项目导入时会自动从仓库下载平台的工件。
7. 单击 **Finish**。空项目将在指定目录中创建，之后 Studio 会自动通过 Gradle 文件开始构建项目信息并为项目建立索引。
8. 项目同步和建立索引过程完成后，将在 **Project** 工具窗口中看到 CUBA 项目树。
9. 打开 **Gradle** 工具窗口，默认固定在右边栏。点击“扳手”图标（**Gradle Settings**）然后在 **Gradle JVM** 字段选择 `Use JAVA_HOME`。如果在下拉列表中没有看到该选项，请确保按照 CUBA 开发者手册中 [安装](https://doc.cuba-platform.com/manual-7.0-chs/setup.html) 部分配置了正确的开发环境。点击 **OK**。
10. 现在可以开始项目的工作了。

### [3.2. 打开现有项目](https://doc.cuba-platform.cn/studio-chs/#open_project)

- 打开已导入的项目

  如果在此计算机上已经通过 CUBA Studio 打开过该项目，请执行以下操作：使用最近项目列表或单击 **Open**，在文件系统对话框中选择 _ 项目目录 _，然后单击 **Open** 按钮。等待 Gradle 同步和项目索引过程完成。只要 CUBA 项目树出现在 **Project** 工具窗口中，就可以开始使用该项目了。

- 首次打开项目

  如果还没有在此计算机上通过 CUBA Studio 打开该项目，例如，只是通过 VCS 下载了代码，请执行以下操作：在欢迎窗口，点击 **Import Project**。如果已经打开了另一个项目，则在主菜单点击 **File > New > Project from Existing Sources**。在文件系统的窗口，选择项目的根目录（包含 `build.gradle` 文件），然后点击 **Open** 按钮。在 **Import Project** 窗口，选择 **Import project from external model** 单选按钮并在下面的列表中选择 **CUBA**，然后点击 **Next**。在导入向导的下一页点击 **Finish**。等待 Gradle 同步和项目索引过程完成。CUBA 项目树会出现在 **Project** 工具窗口中。在主菜单点击 **File > Project Structure**。确保 **Project SDK** 字段的值跟环境中设置的 `JAVA_HOME` 一致。如果看到 `` 值，点击 **New** 然后选择 JDK 安装的目录，比如在 Windows 是 `C:\Java\jdk8u202-b08`，macOS 是 `/Library/Java/JavaVirtualMachines/jdk8u202-b08/Contents/Home`。确保 **Project language level** 字段的值跟 JDK 的版本一致。比如，如果 JDK 是 `1.8` 语言等级必须是 `8 - Lambdas, type annotations, etc.`

- 首次打开基于 CUBA 6.10 的项目

  CUBA Studio 支持基于 CUBA 6.10+和 7.0 的项目。可以打开在旧版本的 Studio 中创建的项目，并将其导入到新 Studio 中，进行以下操作：需要记住 CUBA 6.10 只支持 Java 8，所以 `JAVA_HOME` 环境变量必须指向 JDK 8 的安装目录。在迁移到 CUBA 7 之后，如果需要可以使用新版本的 JDK。如果是第一次打开已有的 CUBA 6.10 项目，需要按照下面的步骤：如果项目使用了 premium 扩展组件（Reports、BPM 等）并且已经有了许可，需要按照 [文档](https://doc.cuba-platform.com/manual-7.0-chs/access_to_repo.html#access_to_premium_repo) 的描述在 `~/.gradle/gradle.properties` 文件内设置 premium 仓库的访问凭证。在命令行使用 `gradlew cleanIdea` 任务删除旧的 IntelliJ 项目文件。如果项目使用 Git 做版本控制，将 `.idea` 行添加到项目根目录下的 `.gitignore` 文件中。确保本地 IDE 设置不会在项目的所有开发人员之间共享。按照上面 **首次打开项目** 部分所述导入项目。

### [3.3. 升级项目](https://doc.cuba-platform.cn/studio-chs/#upgrade_project)

本节介绍将项目升级到较新版本 CUBA 的过程。

建议使用版本控制对项目进行管理，并在升级之前提交所有未提交的改动。这样的话，如果由于某种原因导致升级失败，可以通过版本控制查看执行了哪些更改并快速回滚到以前的版本。

- 按照[前一节](https://doc.cuba-platform.cn/studio-chs/#open_project)中的描述打开项目。

- 单击主菜单中的 **CUBA > Project Properties**，或双击 CUBA 项目树中的 **Project > Properties**。

- 在 **CUBA Project Properties** 对话框中，在 **Platform version** 字段中选择所需的 CUBA 版本。

  如果使用 `repo.cuba-platform.com` 仓库，则可以使用快照（SNAPSHOT）版本。强烈建议不要在生产环境使用快照版本。

- 单击 **OK**，然后确认。

- 如果要升级到较新的功能版本（例如，从 6.10.X 升级到 7.0.X 或从 7.0.Y 升级到 7.1.Y），则会出现 **Migration Required** 弹窗，包含将由 Studio 自动执行的数据库迁移的信息。查看信息确认数据库迁移内容，然后单击 **Migrate**，注意，此时并不会执行数据库更新脚本，只是列出更新步骤。

- Studio 会自动执行迁移，更新脚本（如果需要）并运行 Gradle `clean` 和 `undeploy` 任务。

- 如果升级到新的功能版本，可能有新的改动使得项目不能运行，请查看 [Release Notes](http://files.cuba-platform.com/cuba/release-notes/7.0) 中的 *Breaking Changes* 部分，并相应地对项目进行修改。

- 尝试通过执行 **CUBA > Build Tasks > Assemble** 来组装项目。如果编译不通过，可以按照日志输出来修复代码。

- 执行 **CUBA > Update Database** 将框架中可能新引入的数据库结构更改合并到项目的数据库中。

### [3.4. 启用应用程序](https://doc.cuba-platform.cn/studio-chs/#start_app)

当 Studio 导入了一个 CUBA 项目之后，会创建为 CUBA 特定修改的 Run/Debug 配置，目的是用来运行部署了应用的本地 Tomcat 服务。所以为了运行应用程序并能用调试器进行连接，只需要在主工具栏点击选中的 `CUBA Application` 配置边上的 debug 按钮即可。

![app start 1](https://doc.cuba-platform.cn/studio-chs/img/getting_started/app_start_1.png)

在 **Debug** 工具窗口的 **Console** 标签页可以看到状态。能通过点击打印在 `Server started at` 消息之后的链接地址在默认浏览器打开应用程序的图形界面。

![app start 2](https://doc.cuba-platform.cn/studio-chs/img/getting_started/app_start_2.png)

也可以通过 CUBA 树部分的 **Runs At…** 在浏览器打开运行的应用程序：

![runs at](https://doc.cuba-platform.cn/studio-chs/img/getting_started/runs_at.png)

如果要查看应用程序服务的输出，切换到 **catalina.out** 标签页：

![app start 3](https://doc.cuba-platform.cn/studio-chs/img/getting_started/app_start_3.png)

如果要停止应用程序，可以通过在主菜单选择 **Run > Stop 'CUBA Application'** 或者点击 **Debug** 工具窗口的按钮：

![app start 4](https://doc.cuba-platform.cn/studio-chs/img/getting_started/app_start_4.png)

推荐在开发中使用 Run/Debug 配置来启动应用程序，但是通过 Studio 的 CUBA 主菜单项也可以控制本地 Tomcat 应用程序服务：

![cuba menu 2](https://doc.cuba-platform.cn/studio-chs/img/getting_started/cuba_menu_2.png)

当从 **Start Application Server** 主菜单命令启动服务时，在 Windows 系统能看到一个控制台窗口显示服务器日志。在 Linux 或者 macOS 系统，不会显示控制台，但是可以在 **Terminal** 工具窗口通过执行 `tail -f deploy/tomcat/logs/app.log` 命令查看服务日志。**Stop Application Server** 命令通过发送 SHUTDOWN 信号给停止端口来停止 Tomcat 服务，停止端口是通过项目属性设置（默认是 8005）。

## [4. Studio 用户界面](https://doc.cuba-platform.cn/studio-chs/#ui)

本节介绍 CUBA 特有的 IDE 元素的用户界面。有关 IntelliJ IDEA 的所有功能，请参阅 [文档](https://www.jetbrains.com/help/idea/discover-intellij-idea.html)。

### [4.1. CUBA 项目树](https://doc.cuba-platform.cn/studio-chs/#project_tree)

CUBA 项目树用于展示项目结构及其重要元素，通常在 IDE 左侧的 **Project** 工具窗口中打开。可以使用 **CUBA > Project Tree** [主菜单](https://doc.cuba-platform.cn/studio-chs/#ui_menu)命令或在 **Project** 工具窗口的顶部下拉列表中选择 **CUBA** 来切换到项目树。

项目树包含以下元素：

![cuba tree](https://doc.cuba-platform.cn/studio-chs/img/ui/cuba_tree.png)

1. **Project**
   - [Properties](https://doc.cuba-platform.cn/studio-chs/#project_properties) - 允许配置项目的基本设置。
   - **Build Script** - 包含两个主要项目脚本： [build.gradle](https://doc.cuba-platform.com/manual-7.0-chs/build.gradle.html) （定义构建配置）和 `settings.gradle`（定义项目名称和模块组）。
   - [Modules](https://doc.cuba-platform.cn/studio-chs/#modules) - 显示所有项目模块。
   - **Data Stores** - 显示项目所连接的 [数据存储](https://doc.cuba-platform.com/manual-7.0-chs/data_store.html) 列表。默认情况下，只有 `*MAIN*` 数据存储。
   - [Deployment](https://doc.cuba-platform.cn/studio-chs/#deployment) - 允许定义项目部署选项。
2. [Data model](https://doc.cuba-platform.cn/studio-chs/#data_model) - 显示并管理项目的数据模型。
3. [Middleware](https://doc.cuba-platform.cn/studio-chs/#middleware) - 显示并管理中间件服务和托管 bean。
4. [Generic UI](https://doc.cuba-platform.cn/studio-chs/#generic_ui) - 包含与项目的用户界面相关的所有内容，例如界面、主题等。
5. **REST API** - 允许配置 [REST API](https://doc.cuba-platform.com/manual-7.0-chs/rest_api_v2.html) 功能。
6. **Runs At…** - 允许在外部或嵌入的 Web 浏览器中打开运行中的应用程序。

右键点击树元素能打开右键菜单，可以执行针对当前元素的特定操作。例如，使用 **Data Model** 项的右键菜单，可以从模型生成数据库脚本、从数据库生成模型以及创建新实体或枚举：

![cuba tree context menu](https://doc.cuba-platform.cn/studio-chs/img/ui/cuba_tree_context_menu.png)

### [4.2. CUBA 菜单](https://doc.cuba-platform.cn/studio-chs/#ui_menu)

**CUBA** 主菜单可以快速访问 IDE 中的 CUBA 特有功能。某些菜单项功能与[CUBA 项目树](https://doc.cuba-platform.cn/studio-chs/#project_tree) 及其右键菜单功能相同。

![cuba menu](https://doc.cuba-platform.cn/studio-chs/img/ui/cuba_menu.png)

可以通过右击工具栏并选择 **Customize Menus and Toolbars**，将常用菜单项添加到主工具栏。在弹出的 **Menus and Toolbars** 窗口中，展开 **Main Toolbar** 项并使用 **Add Action** 按钮添加 **Main Menu > CUBA** 树中的条目。

### [4.3. CUBA 设置](https://doc.cuba-platform.cn/studio-chs/#settings)

如果单击 **CUBA > Settings** 主菜单项，将看到使用键字 **cuba** 过滤后的 IDE 设置窗口。在 **Languages & Frameworks** 下找到 **CUBA** 部分。

**CUBA** 部分包含对所有在 Studio 实例中打开的项目都通用的设置。

- **Ask before saving DB scripts with DROP statements** - 建议不要自动执行包含 DROP 语句的更新脚本。
- **Show warning if application server port is in use** - 打开项目且 Tomcat 端口被占用时显示警告。
- **Use embedded browser to open application** - 如果选中该选项，则双击 **Runs At** 项目树中的应用程序 URL 时将使用内嵌 Web 浏览器打开项目地址。
- **Visual designer theme** - 可视化设计工具的主题。使用 `Autodetect` 将根据 IDE 主题自动设置。
- **Visual designer zoom** - 可视化设计工具的默认缩放。在具体的设计界面中可以通过右键菜单进行调整。
- **Old Studio integration enabled** - 如果要将此 IDE 实例与旧的 Studio SE 或 Studio Browser Edition 集成，选中此复选框。这样就可以在新的 IDE 中打开旧 Studio 的项目（这样不需要单独安装其它版本的 IDEA 了）。
- **Listening port** - 用于集成旧 Studio 的端口。确保这个值与旧 Studio 的 **IDE Port** 字段中指定的值相同。
- **Enable transaction block folding** 如果选中，Java 代码编辑器将折叠用于事务控制的旧式 `try-finally` 块。

下一级的 **Project settings** 部分包含当前打开的项目的设置。所有非默认值都存储在项目根目录的 `studio-intellij.xml` 文件中，可以将其添加到版本控制系统，以便在团队中的所有开发人员之间共享项目设置。

- **Check compatibility between data model and database scheme** - 在启动应用程序服务时，如果数据模型的当前状态与数据库架构不一致时显示警告信息。
- **Generate DROP statements in separate update scripts** - 为删除实体、属性或更改属性的数据类型的操作生成更安全的更新脚本。这些脚本分为两部分：在第一部分，列或表被重命名为 `*__UNUSED`，在第二部分对这些对象执行实际的删除操作。
- **Use NVARCHAR when generating scripts for MS SQL Server** -如果启用此选项，对于 Microsoft SQL Server 数据库，使用 NVARCHAR 列类型存储所有 String 属性。
- **Generate script name in format** - 指定 `yyMMddHHmm` 可以将当前时间添加到生成的数据库更新脚本的名称中，这有助于确保在团队工作中脚本的正确顺序。
- **Do not delete columns started with** - 此字段允许为表列指定一个前缀，Studio 将不跟踪具有此前缀的列。一般情况下，如果向映射到实体的表添加了一列，而不将列映射到一个实体属性，Studio 将生成删除此列的更新脚本。如果想避免丢失表中的列，可以在 **Database Scripts** 对话框中不包含此脚本，这个脚本也不会再次生成。或者通过 **Do not delete columns started with** 字段为此类列设置一个公共前缀，并相应地命名列。例如，在字段中输入 `NOT_MAPPED_` 并将列命名为 `NOT_MAPPED_CODE`。
- **Column length for enums with ID of String type** - 此字段允许设置数据库列的长度，该列映射到具有 String 类型标识符的枚举类型的属性。例如，如果始终使用只由一个字符组成的短标识符，则可以将此字段设置为 1，以节省数据库空间。
- **Make plural forms** - 根据英语语法构造名词的复数形式。
- **Repeat entity parent package for screens** - 当 Studio 根据模板生成通用 UI 界面时，如果实体位于比 entity 包更深的一个包中，Studio 将为界面添加此包名。例如，如果 `Customer` 实体位于 `com.company.sample.entity.crm` 中，则其界面的默认包将是 `com.company.sample.web.crm.customer`。
- **Use underscores in generated package names** - 如果选中，包名称将包含以下划线分隔的单词，这些单词是根据以驼峰命名法命名的相应实体名称生成。例如，当为 `com.company.sample.CustomerGrade` 实体生成界面时，界面的包将是 `com.company.sample.customer_grade`。如果该选项关闭，则包名称为 `com.company.sample.customergrade`。
- **Default parent package name for screens** - 当根据与实体无关的模板生成通用 UI 时，可以在这里指定使用的默认包名替代"screens"(默认)。如果模板关联了实体，还会在包之前添加实体名称。例如，如果将此字段设置为"ui"并创建一个空白界面，则包的默认值为 `com.company.sample.web.ui`。
- **Default access modifier** - 设置 Studio 在生成实体字段时使用的默认字段修饰符。
- **Generate entity name with underscore symbol** - 如果选择，实体名称将具有 `namespace_ClassName` 格式，例如 `sales_Customer`。否则它将是 `namespace$ClassName`。
- **Show module prefix migration dialog** - 在项目打开时，显示模块定义迁移的弹窗，其中会建议将构建脚本中的模块定义改为新格式 - 用变量定义模块名称前缀。
- **Instant hot deploy** - 此复选框允许关闭热部署。如果启用了热部署，则 Studio 会在应用或保存对视图、界面、消息或主菜单的更改时动态更新已部署的 Web 应用程序的 UI。
- **Hot Deploy Settings** - 打开对话框来自定义热部署目录。例如，可能希望将 Web 门户的 HTML 文件和 JavaScript 文件所在的文件夹添加为部署目录。当更改这些文件时，Studio 会将它们复制到 Tomcat 中的各自对应的目录。因此，只需重新加载 Web 门户页面即可查看更改。
- **Fold messages in** - 允许控制界面描述和界面控制器中的消息折叠。选中的话，消息键将替换为相应消息包中的实际值。
- **Message folding locale** - 折叠(folding)消息时要使用的本地化消息文件。

## [5. Studio 功能](https://doc.cuba-platform.cn/studio-chs/#features)

这部分文档描述了所有能帮助开发 CUBA 应用程序的 Studio 功能。主要是根据能在[项目树](https://doc.cuba-platform.cn/studio-chs/#project_tree)中看到的项目元素组织相关信息。

有些 Studio 的功能会跟 Intellij 终极版或者第三方插件的功能冲突。比如，为了避免边栏中图标的冲突，可以用下面的步骤禁用终极版中冲突的图标：

- 在 IDEA 菜单中选择 **Settings > Editor > General > Gutter Icons**，
- 反选 **Injection points** 和 **Producers for Disposer methods** 选项，
- 应用更改。

### [5.1. 项目](https://doc.cuba-platform.cn/studio-chs/#project)

本节介绍可用于管理项目基础设施的编辑器和命令。

#### [5.1.1. 项目属性编辑界面](https://doc.cuba-platform.cn/studio-chs/#project_properties)

**Project Properties** 编辑界面允许对项目进行配置。可以从 **CUBA** 主菜单中打开它，也可以通过双击项目树的 **Project > Properties** 项来打开。

- 主选项卡

  **Main** 选项卡显示基本设置。**Repositories** 显示当前在项目中使用的仓库。Studio 扫描这些仓库以寻找可用的平台版本。使用该字段旁边的按钮配置对仓库的访问。有关详细信息，请参阅 [文档](https://doc.cuba-platform.com/manual-7.0-chs/access_to_repo.html)。还可以在 `build.gradle` 中手动注册包含应用程序组件的其它仓库，并且仓库数量不受限制。**Platform version** 选择平台的版本。如果选择了较新版本，则会根据需要决定是否会执行版本的自动迁移。在 **App components** 面板中，可以添要在项目中使用的由平台提供的或自定义的应用程序组件。如果需要更改应用程序服务的路径，请在 **Tomcat path** 字段中指定新路径。下一次执行 `gradlew deploy` 或 `gradlew start` 会将 Tomcat 安装到该位置。**Tomcat ports** 分组允许为通过 [快速部署](https://doc.cuba-platform.com/manual-7.0-chs/fast_deployment.html) 安装在 `deploy/tomcat` 文件夹中的 Tomcat 应用程序服务分配非标准端口。需要特别留意 **HTTP port** 字段，该字段 Tomcat 监听的 HTTP 连接端口，以及 `cuba.webPort` 、`cuba.webAppUrl` 、 `cuba.restApiUrl` 和 `cuba.connectionUrlList` 应用程序属性。在 **AJP port** 字段中，可以设置 AJP 连接器的端口。在 **Shutdown port** 字段中，可以设置 Tomcat 监听的 SHUTDOWN 命令端口。在 **Debug port** 字段中，可以设置 Tomcat 监听的 Java 调试器连接端口。如果更改了此端口，还应在 IDE 的调试配置中进行同步更改。**Available locales** 字段允许设置应用程序可用的 [本地化语言](https://doc.cuba-platform.com/manual-7.0-chs/localization.html)。单击该字段旁边的按钮打开语言环境编辑界面。位于编辑界面窗口中的 **Locale select visible** 复选框控制 [cuba.localeSelectVisible](https://doc.cuba-platform.com/manual-7.0-chs/app_properties_reference.html#cuba.localeSelectVisible) 应用程序属性的值。 编辑界面还可以为 [解析和格式化数据](https://doc.cuba-platform.com/manual-7.0-chs/datatype.html)定义新的或覆盖已有的格式化字符串。**Groovy support** 复选框用于在应用程序中启用 Groovy 代码支持：比如，在界面控制器类中。

- 数据存储选项卡

  **Data Stores** 选项卡显示项目的数据库连接。编辑界面的上半部分包含主数据存储的设置。可以在 **Database type** 字段中选择数据库服务的类型。下面的字段允许更改数据库 URL，并指定用户名、密码和可选的连接参数。连接参数的格式取决于所选的 DBMS。字符串中应在数据库名称和参数之间包含分隔符。例如，要指定 Microsoft SQL Server 2008+ 实例名称，请在字段中使用以下字符串：`;instanceName=myinstance`如果启用了 **Custom database URL** 复选框，就可以指定自定义的数据库连接 URL。在这种情况下应提供 **Host** 和 **Database** 名称，因为它们在 `build.gradle` 中被单独使用。对于 HSQLDB，Studio 本身提供数据库服务，并将数据库文件存储在 `build/hsqldb` 目录中。**Additional data stores** 面板包含项目中注册的其它数据存储列表。创建或编辑其它数据存储时，会显示 **Data Store** 对话框。对话框上包含以下字段：**Data store name** - 数据存储的名称。名称应该只包含字母、数字和下划线，并且应该不同于项目名称。**Data store type** - 数据存储的类型：`RdbmsStore` 或 `Custom`，有关详细信息请参阅文档。对于 `RdbmsStore`，应该设置如下字段。**DataSource JNDI name** - Studio 基于数据存储的名称自动进行设置。**Database type**、**URL** 等 - 数据库连接参数。

#### [5.1.2. 模块管理](https://doc.cuba-platform.cn/studio-chs/#modules)

Studio 允许创建、编辑和删除项目的可选模块： **core** 、 **gui** 、 **web** 、 **web-toolkit** 、 **portal** 和 **front**。可以使用 **CUBA > Advanced > Manage Modules** 主菜单或从项目树的 **Project > Modules** 项的右键菜单中执行此操作。

项目树的 **Modules** 部分显示项目中当前使用的模块。创建新项目时，默认包含 **global** 、 **core** 和 **web**。对于每个模块，Studio 也显示位于此模块中的配置文件。

#### [5.1.3. 部署设置](https://doc.cuba-platform.cn/studio-chs/#deployment)

Studio 中有一些与部署相关的编辑界面，用于对构建部署工件的 Gradle 任务进行设置。可以通过 **CUBA > Deployment** 主菜单打开这些编辑界面，也可以通过双击项目树中的 **Project > Deployment** 项来打开。

**WAR Settings** 编辑界面允许设置 WAR 文件的构建。完成设置后，会在 `build.gradle` 中创建 [buildWar](https://doc.cuba-platform.com/manual-7.0-chs/build.gradle_buildWar.html) 任务。

- **Build WAR** - 如果选中，`buildWar` 任务会被配置在 `build.gradle` 中。
- **Include JDBC driver** - 是否应将 JDBC 驱动程序包含在 WAR 文件中。
- **Include Tomcat’s context.xml** - 是否应将 `context.xml`（Tomcat 部署描述）包含在 WAR 文件中。
- **Custom context.xml path** - Tomcat 部署描述 `context.xml` 相对于项目根目录的路径。这个字段仅在选中 **Include Tomcat’s context.xml** 时有效。单击 **Generate** 来自动创建此文件。
- **Single WAR for Middleware and Web Client** - 是否构建将中间件和 Web 客户端应用程序 block 打包到一起的单个 WAR。
- **Custom web.xml path** 指定用于单 WAR 的特定 `web.xml` 文件。单击 **Generate** 可自动创建此文件。
- **Logback configuration file** - `logback.xml` 配置文件相对于项目根目录的路径。单击 **Generate** 以自动创建此文件。
- **App properties** - 要为此部署定义的一组应用程序属性。这些属性会添加到 WAR 内的 `/WEB-INF/local.app.properties` 文件中。
- **UberJAR Settings** 编辑界面允许对 Uber JAR 的构建进行设置。完成设置后，会在 `build.gradle` 中创建 [buildUberJar](https://doc.cuba-platform.com/manual-7.0-chs/build.gradle_buildUberJar.html) 任务。
- **Build Uber JAR** - 如果选中，`buildUberJar` 任务会被配置在 `build.gradle` 中。
- **Single Uber JAR** - 如果选中，`buildUberJar` 任务会将所有应用程序模块打包到一起，创建一个 Uber JAR。
- **Logback configuration file** - `logback.xml` 配置文件相对于项目根目录的路径。单击 **Generate** 可自动创建此文件。
- **Custom Jetty environment file** - 嵌入式 Jetty 服务使用的 `jetty-env.xml` 配置文件路径，相对于项目根目录。必填项。单击 **Generate** 可自动创建此文件。
- **App properties** -要为此部署定义的一组应用程序属性。这些属性将被添加到 Uber JAR 内的 `/WEB-INF/local.app.properties` 文件中。
- **Core port、 Web port、 Portal port** 字段允许为相应应用程序块的嵌入式服务设置端口。如果选中 Single Uber JAR，这些字段就不设置了。默认端口值在 [文档](https://doc.cuba-platform.com/manual-7.0-chs/build.gradle_buildUberJar.html) 中有描述。在运行 JAR 时可以使用 `-port` 命令行参数设置端口。

### [5.2. 数据模型](https://doc.cuba-platform.cn/studio-chs/#data_model)

在本节中，我们将介绍如何使用应用程序的数据模型。

#### [5.2.1. 使用实体](https://doc.cuba-platform.cn/studio-chs/#data_model_entities)

- 创建新实体

  在项目树中选择 **Data Model** 部分或它下面的包，然后从右键菜单中选择 **New > Entity**。出现 **New CUBA Entity** 对话框。在 **Entity name** 字段中输入实体类的名称，选择实体及其 ID 的类型。Studio 将创建实体类，根据实体类型的不同在 `persistence.xml` 或 `metadata.xml` 中进行注册。创建的类会在源代码编辑界面中打开。编辑界面底部会显示三个选项卡：**Text** 包含源码。**Designer** 显示实体设计界面，可以使用图形界面配置实体及其属性，而不用编写 Java 代码。**DDL Preview** 包含相应表及其参考约束的只读 DDL 代码。

- 创建实体属性

  有多种方法可以向实体添加属性。使用实体设计器的图形化界面：切换到 **Designer** 选项卡，单击 **Attributes** 表下方的 **New** 并填写 **New Attribute** 窗口中的必填字段。**Name** 字段旁边的按钮用于直接设置属性的用户友好名称。友好名称存储在 `messages.properties` 文件中，UI 组件默认使用这个文件来获取实体属性名称。如果为应用程序定义了多种语言，可以为所有语言指定本地化名称。![attribute l10n](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/attribute_l10n.png)使用从源码打开的独立窗口。在源码中将光标定位在最后一个字段下方，然后按下 Alt+Insert (Cmd+N)。在 **Generate** 菜单中，选择 **Add Attribute**。Studio 将显示 **New Attribute** 窗口，和从图形界面打开的一样。![new attribute 2](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/new_attribute_2.png)还可以手动编写属性字段，生成 getter 和 setter 方法，然后在 **Generate** 菜单中选择 **JPA Annotations**，这样可以使用默认参数添加 JPA 注解。Studio 可以帮助将新增的属性添加到为此实体创建的 UI 界面。将光标定位到包含该属性的行，然后按 Alt+Enter（Option + Enter）或单击灯泡图标并选择 **Add entity attribute to screens**：![add attribute to screens](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/add_attribute_to_screens.png)按 Enter 键，Studio 将打开一个对话框，其中包含使用了被编辑实体的界面列表。可以选择一个界面，Studio 会将该属性添加到此界面的相应 UI 组件中，例如添加到表格或表单中。

- 创建实例名称

  可以用作另一个实体的引用属性的实体（例如 `Customer` 可以是 `Order` 的属性）需要一个模式(pattern)来生成实例的有意义的名称。此模式(pattern)由实体类上的 [@NamePattern](https://doc.cuba-platform.com/manual-7.0-chs/entity_class_annotations.html#namePattern_annotation) 注解定义。将光标定位在类代码中的任何位置，即可在 Studio 中创建实体的名称模式，按 Alt+Enter（Option+Enter）并选择 **Add name pattern**（仅当实体没有 `@NamePattern` 注解时才显示此项）：![create name pattern](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/create_name_pattern.png)按 Enter 键，Studio 将显示实体的所有属性列表。选择一个或多个属性，然后按 Enter 键。Studio 将在实体类上生成 `@NamePattern`。

- 为新属性创建消息

  手动创建新的实体属性时，其名称会高亮突出显示，以提醒在相应的消息包中创建用户友好的属性名称：![create message 1](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/create_message_1.png)在突出显示的属性上点击 Alt+Enter（Option+Enter），然后选择 **Create message in the message bundle**：![create message](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/create_message.png)

- 移除实体

  要移除实体，使用 **Safe delete** 选项查找并清理对实体的引用：![remove entity](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/remove_entity.png)对实体的一些引用会被自动删除，比如在 `persistence.xml` 和 `metadata.xml` 文件中对实体的引用。如果存在对实体的引用，将会弹出一个对话框显示这些引用。 点击对话框上的 **View Usages** 按钮, 可在 **Find** 工具窗口中查看这些引用，这时可以根据情况点击 **Cancel** 或 **Do Refactor** 按钮。

#### [5.2.2. 使用视图](https://doc.cuba-platform.cn/studio-chs/#data_model_view)

要为实体创建新的 [视图](https://doc.cuba-platform.com/manual-7.0-chs/views.html)，请在项目树中选择实体，然后在右键菜单中点击 **New > View**。

![create view](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/create_view.png)

视图设计界面会被打开。它包含以下字段：

- **Entity name** - 要创建视图的实体的名称。
- **Name** - 新视图的名称。
- **Extends** - 内置或自定义视图，新视图会扩展其属性。任何实体都有三种内置视图：
  - `_local` 包含实体的所有本地属性（不引用其它实体的属性），
  - `_minimal` 包含名称模式中列出的属性，
  - `_base` 包括所有本地非系统属性和由 `@NamePattern` 定义的属性（实际上是 `_minimal` +`_local`）。
- **Configuration file** - 用于存储此视图的 [视图配置文件](https://doc.cuba-platform.com/manual-7.0-chs/views.xml.html)。默认情况下，Studio 在 `global` 模块中生成一个 `views.xml` 文件。

当前实体的完整属性列表显示在字段下方的树中。可以通过选中属性前面的复选框来选择要包含在视图中的属性。

如果视图继承另一个视图，则会选中所有继承的属性，并禁用相对应的复选框。

如果选择引用属性，则右侧面板中会显示以下属性：

- **Entity** - 引用的实体名称。
- **View** - 加载引用实体的可选视图。建议使用已命名视图而不是临时指定视图属性，因为这样可以更容易地维护复杂视图。此外，即使指定了视图名称，仍然可以通过选择属性树中的复选框来添加视图中未包含的属性。
- **Fetch** - 用于引用属性的可选设置，指定如何从数据库中获取相关实体。有关详细信息，请参阅 [文档](https://doc.cuba-platform.com/manual-7.0-chs/views.html)。

单击 **OK** 关闭设计界面后，可以在实体下的项目树中找到新视图：

![create view 2](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/create_view_2.png)

如果双击项目树中的视图项，Studio 将在代码编辑界面中打开 `views.xml` 并将光标定位在视图定义上。代码编辑界面底部有两个选项卡：**Text** 和 **Structure**。后者显示此配置文件中定义的视图列表。

在 XML 中编辑视图定义时，使用 Ctrl+Space 自动完成属性名称：

![view edit 1](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/view_edit_1.png)

要留意高亮突出显示的属性，它们很有可能不存在：

![view edit 2](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/view_edit_2.png)

可以通过多种方式打开视图的图形设计界面：

- 在项目树中选择视图，然后单击 **Edit View** 右键菜单项。
- 将光标定位在配置文件代码中的视图元素上，按 Alt+Enter（Option+Enter），在弹出菜单中选择 **Edit view**，然后按 Enter 键。
- 切换到配置文件代码编辑界面的 **Structure** 选项卡，选择视图并点击 **Edit** 按钮。

#### [5.2.3. 数据库迁移](https://doc.cuba-platform.cn/studio-chs/#database_migration)

Studio 能够创建 DDL 脚本，以使数据库架构与项目的数据模型保持同步。生成的脚本可以从 Studio 直接执行，也可以由 [Gradle 任务](https://doc.cuba-platform.com/manual-7.0-chs/db_update_gradle.html) 执行，还可以在应用程序本身 [启动时](https://doc.cuba-platform.com/manual-7.0-chs/db_update_server.html) 执行。

要生成 DDL 脚本，请在主菜单中单击 **CUBA > Generate Database Scripts**，或在项目树中选择 **Data Model**，然后在右键菜单中单击 **Generate Database Scripts**。

Studio 将打开 **Database Scripts** 窗口，窗口上有以下选项卡：

- Updates

  **Updates** 选项卡上显示出用来将数据库更新为数据模型当前状态的脚本。更新脚本保存在 `modules/core/db/update` 目录。这些脚本具有自动生成的名称，通过前缀定义执行顺序。包含 DROP 语句的脚本以红色突出显示。可以通过单击 ![Create](https://doc.cuba-platform.cn/studio-chs/img/plus_button.png) 按钮添加任意脚本，添加的脚本后续将与自动生成的脚本一起保存并执行。单击 ![Remove](https://doc.cuba-platform.cn/studio-chs/img/remove_button.png) 按钮可以编辑或完全删除新生成的脚本。如果单击 ![Exclude selected](https://doc.cuba-platform.cn/studio-chs/img/exclude_button.png)（排除），这时会两个选项：将脚本移动到手动执行的脚本目录：`modules/core/db/update-manually`。然后当运行 **Update database** 时，脚本不会自动被执行，但可以在需要时手动运行它。此选项对于用于删除先前重命名为 `*__UNUSED` 的表或列的脚本非常有用。排除脚本：排除的脚本不会保存到 `modules/core/db/update` 目录中，而是记录在项目文件夹中的 `studio-intellij.xml` 文件中。再次生成脚本时，Studio 将忽略与排除脚本相对应的更改。这样就允许数据库架构和实体模型之间存在差异。例如，可能希望在对应项目实体的一个表中添加数据库字段，但不将其映射到实体属性。当 Studio 生成了从数据库中删除该字段的脚本时，只需将其排除，Studio 将不再生成同样的脚本。

- Init Tables

  执行 **Create Database** 时，**Init Tables** 脚本会在 **Init constraints** 和 **Init data** 脚本之前执行，并创建所有的表。开发人员可以编辑脚本，但要需要保留分隔表的注释。该脚本保存在 `10.create-db.sql` 文件中。

- Init Constraints

  **Init Constraints** 脚本在 **Init tables** 脚本之后执行，创建完整性约束。开发人员可以编辑该脚本，但需要保留分隔表的注释。该脚本保存在 `20.create-db.sql` 文件中。

- Init Data

  **Init Data** 脚本允许插入额外的数据或数据模型中不存在的数据结构信息。在初始化结束时执行。该脚本保存在 `30.create-db.sql` 文件中。

如果项目包含应用程序组件（扩展），但是此组件不为当前数据库提供 DDL 脚本，Studio 会为组件生成脚本，并在 **Init {component} tables** 和 **Init {component} constraints** 选项卡中显示。脚本分别保存在 `01.{component}-create-db.sql` 和 `02.{component}-create-db.sql` 文件中。

单击 **Save and close** 以保存所有生成的脚本。可以在 **Project > Data Stores > Main Data Store** 项目树部分中找到脚本。

要运行更新脚本，先停止应用程序服务器（如果在运行），然后从 **CUBA** 主菜单执行 **Update Database**。如果要使用初始化脚本从头开始重新创建数据库，请执行 **Create Database**。

#### [5.2.4. 生成数据模型](https://doc.cuba-platform.cn/studio-chs/#generate_model)

Studio 允许为现有数据库创建数据模型和标准 UI 界面。单击 **CUBA > Advanced > Generate Model** 主菜单项或在项目树中选择 **Project > Data Stores**，然后在右键菜单中点击 **Generate Model**。如果有多个数据存储，Studio 会显示一个对话框，可以选择其一。

然后 Studio 打开 **Generate Model from Database** 向导。

- 步骤 1

  这是模型生成向导的第一步。![generate model step1](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/generate_model_step1.png)可选步骤：单击 ![Settings](https://doc.cuba-platform.cn/studio-chs/img/gear_button.png) 以设置创建的新实体的 Java 包位置以及实体的系统属性与数据库列的默认映射。例如，如果数据库中的所有或大多数表包含 `Modified` 和 `ModifiedBy` 列，则可以将它们映射到被创建的实体的 `Updatable.updateTs` 和 `Updatable.updatedBy` 属性。在这种情况下，无需为每个表单独映射它们。使用 **Exclude columns from mapping** 列表可以为所有表设置不需要映射到属性的列。向导中会列出在项目数据模型中没有对应实体的表。可以使用上面的过滤器字段按名称查找表。选择要映射到数据模型的表。某些表通过外键依赖于其它表，因此当选择这些表时，它所依赖的所有表也将被选中。如果取消选择一个表，则也会取消选择所有依赖它的表。可以通过单击右侧的复选框来选择或取消选择所有可用表。单击 **Next**。

- 步骤 2

  在此步骤中，可以查看和编辑为所选表的自动生成的映射。![generate model step2](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/generate_model_step2.png)**Status** 列描述自动映射的结果：**OK** - 自动映射成功，所有列都映射到新实体。**Join table** - 识别出实体之间的关联，会被映射为多对多关系的连接表。**There are unmapped columns** - 某些列无法映射到新实体。**New PK will be created** - 该表没有主键。将创建一个新的 UUID 类型的主键。**Composite PK will be replaced** - 该表具有复合主键，但没有其它表引用它。复合主键将被替换为 UUID 类型的主键。**Composite PK referenced by other tables** - 该表有一个复合主键，一些表引用它。Studio 无法映射此类表。**Unsupported PK type** - 该表具有不支持的主键类型。Studio 无法映射此类表。**Choose primary key for DB view** - 它是一个数据库视图，应该选择适合作为实体标识符的一列或一组列。在这种情况下，单击 **Choose PK** 按钮并选择主键的列。![Refresh mapping](https://doc.cuba-platform.cn/studio-chs/img/refresh_button.png) 按钮允许重新运行所选表的自动映射。例如，可以切换到数据库 SQL 工具，对数据库架构进行一些更改，然后返回到向导并再次执行映射过程。![Edit mapping](https://doc.cuba-platform.cn/studio-chs/img/edit_button.png) 按钮打开一个包含映射详细信息的对话框窗口。在这里，可以更改实体名称和实体类要实现的系统接口。根据实现接口的不同，为了兼容 CUBA 的实体，会影响数据库列的创建数量。![generate model step2 2](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/generate_model_step2_2.png)当选中的是数据库视图并且需要选择用于实体标识符的列时，将显示 **Choose PK** 按钮而不是 **Edit mapping**。通过单击 **Back**，可以返回到上一步以选择或取消选择表。单击 **Next** 转到下一步。

- 步骤 3

  在此步骤中，可以指定应为新实体创建哪些 UI 界面。![generate model step3](https://doc.cuba-platform.cn/studio-chs/img/features/data_model/generate_model_step3.png)如果取消选中 **Create standard screen** 复选框，Studio 将不会为新实体生成 UI。使用 **In module** 、**Package** 和 **Menu** 字段指定界面源代码的位置以及在主菜单中它们的显示位置。使用 **Standard screens** 列中的下拉列表选择要生成的界面类型。可以安全地跳过此步骤，并在完成模型生成过程后为实体生成 UI 界面。单击 **Next** 转到下一步。

- 步骤 4

  这是模型生成向导的最后一步。**Import scripts** 表包含将在数据库上执行的脚本列表，查看这些脚本，以确认其符合要创建的实体。在此之前，项目中不会创建任何内容，甚至也不会保存到磁盘中。Studio 实际上只会在点击 **Run all scripts** 或 **Run script** 时生成实体和界面并保存脚本。可以在此页面上查看和编辑脚本，然后运行它们，或者仅保存脚本，稍后通过数据库管理工具来运行。导入脚本保存在 `modules/core/db/import` 目录中。

#### [5.2.5. 集成自定义数据库](https://doc.cuba-platform.cn/studio-chs/#custom_db)

如 [文档](https://doc.cuba-platform.com/manual-7.0-chs/arbitrary_dbms.html) 中所述，框架允许使用 EclipseLink ORM 支持的任何 DBMS 作为项目数据库。Studio 可以帮助创建此类集成所需的文件。

在菜单中选择 **CUBA > Advanced > Define Custom Database**。

在打开的窗口中可以设置新自定义数据库的属性。根据这些属性，Studio 会针对数据库生成设计时和运行时的支撑代码。

- **DB type id** - 用于 `cuba.dbmsType` 应用程序属性的数据库类型标识符。
- **DB type name** - 要在 Studio 中显示的数据库类型的用户友好名称。

单击 **OK** 后，Studio 会在 `com.haulmont.cuba.core.sys.persistence` 中生成 Java 类，并在项目的 `com.haulmont.studio.db.{db_id}` 包中生成 Groovy 类。自动生成的示例实现适用于 Microsoft SQLServer 数据库，需要适当地对其进行一些修改。

首先，修改 `com.haulmont.studio.db.{db_id}.{db_id}DbProperties` 类。当此类适配了新的数据库时，将能够在 Studio 中将项目切换到此数据库。重新打开项目在数据库类型下拉列表中查看新数据库。

要在运行时连接到新数据库，请修改 `com.haulmont.cuba.core.sys.persistence` 包的 `{db_id}DbmsFeatures` 和 `{db_id}DbTypeConverter` 类。`{db_id}SequenceSupport` 类仅用于生成整数标识符和唯一编号。

最后，修改 `com.haulmont.studio.db.{db_id}.{db_id}DdlGenerator` 类，以便在需要时可以由 Studio 正确生成 **init** 和 **update** 数据库脚本。如果不需要为此数据库生成 DDL 脚本，可跳过此步骤。

如果将自定义数据库用作主数据存储，则在生成数据库脚本时，Studio 将为所有应用程序组件（包括 CUBA）创建 **init** 脚本。这些脚本不包含一些必须的初始化数据，因此必须将以下内容添加到项目的 **Init data** 脚本中（`30.create-db.sql`）：

```
insert into SEC_GROUP (ID, CREATE_TS, VERSION, NAME, PARENT_ID)
values ('0fa2b1a5-1d68-4d69-9fbd-dff348347f93', current_timestamp, 0, 'Company', null)^

insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, NAME, GROUP_ID, ACTIVE)
values ('60885987-1b61-4247-94c7-dff348347f93', current_timestamp, 0, 'admin', 'admin',
'cc2229d1b8a052423d9e1c9ef0113b850086586a',
'Administrator', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93', 1)^

insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, NAME, GROUP_ID, ACTIVE)
values ('a405db59-e674-4f63-8afe-269dda788fe8', current_timestamp, 0, 'anonymous', 'anonymous', null,
'Anonymous', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93', 1)^
```

### [5.3. 中间层](https://doc.cuba-platform.cn/studio-chs/#middleware)

[项目树](https://doc.cuba-platform.cn/studio-chs/#project_tree)集中在一个地方显示所有中间层服务和托管 bean。在下面的章节中，我们将介绍如何创建新服务和 bean。

#### [5.3.1. 创建服务](https://doc.cuba-platform.cn/studio-chs/#middleware_services)

[服务](https://doc.cuba-platform.com/manual-7.0-chs/services.html) 是容器管理的组件集，它们构成中间层边界并为客户端层提供接口。服务可以包含业务逻辑本身，也可以将执行委托给[托管 Bean](https://doc.cuba-platform.cn/studio-chs/#middleware_beans)。

要创建新服务，请选择 **Middleware** 项目树区域，然后在右键菜单中单击 **New > Service**：

![create service](https://doc.cuba-platform.cn/studio-chs/img/features/middleware/create_service.png)

输入服务接口的名称时，将自动生成相应的 bean 名称和服务名称常量：

![create service 2](https://doc.cuba-platform.cn/studio-chs/img/features/middleware/create_service_2.png)

之后，将在 **global** 模块中创建服务接口，并在 **core** 模块中创建其实现。此外，新服务将自动注册在 `web-spring.xml` 配置文件中。

可以从代码编辑器边栏上的标记轻松地从接口切换到服务 bean 并返回：

![service interface](https://doc.cuba-platform.cn/studio-chs/img/features/middleware/service_interface.png)

一旦在服务接口中创建了方法，Studio 检查器就会建议在 bean 类中进行实现：

![service interface 2](https://doc.cuba-platform.cn/studio-chs/img/features/middleware/service_interface_2.png)

#### [5.3.2. 创建托管 Bean](https://doc.cuba-platform.cn/studio-chs/#middleware_beans)

Studio 在项目树的 **Middleware > Beans** 部分显示中间层（包括实体和事务监听器）的所有 [托管 Bean](https://doc.cuba-platform.com/manual-7.0-chs/managed_beans.html)。

![studio beans](https://doc.cuba-platform.cn/studio-chs/img/features/middleware/studio_beans.png)

要创建托管 bean，请通过在项目树中选择一个包并在右键菜单中单击 **New > Java Class** 来创建 Java 类。然后将 `@Component` 注解添加到类中，如上例所示。为了最大限度地降低名称冲突的风险，特别是在使用应用程序组件时，请通过注解为 Bean 明确地指定名称。

### [5.4. 通用 UI](https://doc.cuba-platform.cn/studio-chs/#generic_ui)

Studio 提供了许多有助于在应用程序中使用 [通用 UI](https://doc.cuba-platform.com/manual-7.0-chs/gui_framework.html) 的功能。

在项目树中，可以看到 Generic UI 的以下元素：

- [Web Menu](https://doc.cuba-platform.cn/studio-chs/#generic_ui_menu) 打开主菜单的图形编辑界面。
- [Main Message Pack](https://doc.cuba-platform.com/manual-7.0-chs/main_message_pack.html) 部分包含主菜单项和通用 UI 元素的消息。
- [Screens](https://doc.cuba-platform.cn/studio-chs/#screen_descriptor) 部分显示已有的应用程序界面。
- [Themes](https://doc.cuba-platform.cn/studio-chs/#generic_ui_themes) 用于管理应用程序的可视化展现。

#### [5.4.1. 创建和移除界面](https://doc.cuba-platform.cn/studio-chs/#create_screen)

要创建新的 Generic UI 界面，请在项目树中选择 **Generic UI**，然后在右键菜单中选择 **New > Screen**。如果要为实体创建 CRUD 界面，请在项目树中选择此实体或其中一个视图，然后在右键菜单中点击 **New > Screen** ：

![create screen](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/create_screen.png)

Studio 将显示可用模板的列表。该列表分为两部分：**Screen Templates** 和 **Legacy Screen Templates**。 前者包含框架版本 7 以上可用于新界面 API 的模板，而后者包含也可用于版本 6 的界面模板。

![create screen 2](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/create_screen_2.png)

如果为在项目树中选中的实体或视图创建界面，则 **Entity** 和 **Entity view** 字段会自动填充：

![create screen 3](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/create_screen_3.png)

**Advanced** 部分允许修改自动生成的界面描述和控制器名称以及界面 ID。当某个实体有多个界面时，这很有用。

单击 **Finish** 时，将创建并打开界面 XML 描述和 Java 控制器文件。对于没有使用 `UiDescriptor` 和/或 `@UiController` 注解的旧版界面，其界面描述被注册在 `web-screens.xml` 文件中。

移除界面文件时，使用 **Safe delete** 选项查找并清理对这个界面的引用：

![safe delete screen 1](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/safe_delete_screen_1.png)

对界面的一些引用会被自动删除，比如在 `web-menu.xml` 和 `web-screens.xml` 文件中对界面的引用。如果存在对界面的引用，将会弹出一个对话框显示这些引用。 点击对话框上的 **View Usages** 按钮, 可在 **Find** 工具窗口中查看这些引用，这时可以根据情况点击 **Cancel** 或 **Do Refactor** 按钮：

![safe delete screen 2](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/safe_delete_screen_2.png)

#### [5.4.2. 使用界面描述](https://doc.cuba-platform.cn/studio-chs/#screen_descriptor)

[界面描述](https://doc.cuba-platform.com/manual-7.0-chs/screen_descriptors.html) 编辑器底部包含两个选项卡：**Text** 和 **Designer**。在 **Text** 选项卡上，可以直接编辑 XML，而 **Designer** 选项卡包含一个界面布局的可视化编辑器。

![xml descriptor](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/xml_descriptor.png)

可以使用代码编辑器边栏上的标记从界面描述切换到相应的界面控制器，或者在项目树中选择界面描述，然后单击右键菜单中的 **Go to controller**。

Studio 会检查界面布局是否存在错误和不一致，并且检查内部和外部引用。出现下列情况，会用警告或高亮显示 XML 元素的方式进行提醒：

- 由于 XML 错误，无法组装界面布局。
- 组件属性路径和名称与应用程序数据模型不对应。
- 组件大小冲突： `width` 、 `height` 和 `expand` 属性值的冲突。
- `dataContainer` 和 `dataLoader` 属性没有引用任何现有的数据容器或数据加载器。
- `form` 中的字段没有显式定义 `property` XML 属性：此时，`id` 将被隐式地用作 `property`。
- `form` 元素语义错误：字段重复或位于 `column` 元素之外。
- `gridLayout` 中的列数与指定的数字不匹配。
- 在扩展界面中出现重复的元素属性，比如父界面和扩展界面中同时定义了完全一样的属性时。
- 扩展界面中的元素的命名与父界面中不同，或者放置位置不正确。
- `messagesPack` 属性指定的值不是一个有效的包，这个包要至少包含一个 `messages_xx.properties` 文件。
- 过时的 XSD 引用。
- `id` 值在界面内不是唯一的。

可以在 **Settings** 窗口中配置检查器（**CUBA > Settings > Editor > Inspections**）。

Studio 也能加速界面组件的开发。使用 Alt+Insert (Cmd+N) 快捷键打开特定 UI 和数据组件的相关功能。比如，需要在 [Form](https://doc.cuba-platform.com/manual-7.0-chs/gui_Form.html) 组件添加一个新字段，可以将光标移动到 `form` 元素内然后按照下面的方式之一添加字段：

- 按下 Alt+Insert (Cmd+N)，选择 **Add field**，然后选择属性和字段标签，

  ![gui Form add](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/gui_Form_add.png)

- 输入 `field` 然后按下 TAB 键，然后选择属性和字段标签。

  ![gui Form add tab](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/gui_Form_add_tab.png)

**Designer** 选项卡显示可视化设计器，允许以 WYSIWYG 方式开发界面布局和设置 UI 组件属性。

![xml descriptor 2](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/xml_descriptor_2.png)

设计界面工作区分为四个面板：

- **Canvas** 是工作区，可以在其中按所需的布局排列组件。可以使用控制工具调整组件的大小和对齐：
  - 水平扩展，
  - 垂直扩展，
  - 垂直/水平对齐组件。
- **Palette** 面板显示可用的界面组件集合：
  - 容器；
  - 组件；
  - 数据组件：容器和加载器;
  - 非可视化组件：操作、对话框模式设置、计时器。

要将组件添加到布局，请将其从组件面板(palette)拖放到画布或组件树(hierarchy)面板上。

- **Hierarchy** 面板显示添加到布局的组件树。可以使用拖放重新排列树的元素，因为有时这比在画布(Canvas)上执行相同操作更方便。可以使用右键菜单来删除、复制、剪切或粘贴组件树中的元素。
- **Properties** 面板显示可视化组件的属性。

#### [5.4.3. 使用界面控制器](https://doc.cuba-platform.cn/studio-chs/#screen_controller)

本节介绍 Studio 为 [界面控制器](https://doc.cuba-platform.com/manual-7.0-chs/screen_controllers.html) 提供的功能。

利用源码编辑器的边栏图标可以快速切换到相应的 XML 描述文件、定位到注入组件的 XML 定义以及其它导航功能。

![controller](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/controller.png)

- 依赖注入

  依赖注入是在界面控制器代码中获取对可视化组件和 API 端点(api endpoint)的引用的主要方式。当然，也可以编写所需类型的字段并手动进行注解。但是 Studio 提供了一个专用的窗口，这个窗口允许从列表中选择一个对象并自动创建合适的字段。按下 Alt+Insert（Cmd+N）键，在弹出的 **Generate** 菜单中选择 **Inject…**，就会打开这个窗口：![controller injection](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/controller_injection.png)以下对象可以被注入到控制器中：界面 XML 描述中定义的可视化组件和数据组件，界面 API 接口，基础设施接口，中间层服务，配置接口。

- 事件处理

  通过创建事件处理程序，可以在界面生命周期的各个点执行代码并对用户操作做出响应。处理程序是一个用 `@Subscribe` 注解的控制器方法，使用事件作为输入参数。按下 Alt+Insert（Cmd+N）键，在弹出的 **Generate** 菜单中选择 **Subscribe to Event**，就可以在 Studio 中创建此类方法：![subscribe dialog](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/subscribe_dialog.png)每个事件在窗口右侧都提供了描述，这个描述是从事件的 Javadoc 中提取的。打开的窗口中提供以下事件：表示界面生命周期的控制器事件。可对按钮点击、表格选择、操作等做出响应的组件事件。表示此界面的外部框架的生命周期的框架事件(Frame Events)。允许对数据上下文更改做出响应，并在数据提交之前和之后执行代码的数据上下文事件。允许接收有关数据容器和实体状态更改通知的数据容器事件。

- 委托

  使用委托，可以为各种界面机制提供代码来代替其标准实现。例如，可以提供自己的函数来提交数据或选择表格行的图标。委托是具有特定签名的控制器方法，并使用 `@Install` 进行注解。按下 Alt+Insert（Cmd+N）键，在弹出的 **Generate** 菜单中选择 **Install Delegate**，就可以在 Studio 中创建此类方法：![install dialog](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/install_dialog.png)每个事件都在窗口右边提供了描述，该描述是从框架的 Javadocs 中提取的。

#### [5.4.4. 使用应用程序菜单](https://doc.cuba-platform.cn/studio-chs/#generic_ui_menu)

菜单设计器允许定义应用程序主菜单并将其存储在 `web-menu.xml` 配置文件中。**Structure** 选项卡显示图形设计器，可以在 **Text** 选项卡上编辑菜单的 XML 代码。

![web menu](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/web_menu.png)

菜单可以以两种模式创建：

- 在 **Single mode** 中，菜单仅包含当前项目的 `web-menu.xml` 文件中的菜单项。在这种情况下，需要创建所有菜单项，必要时还需要将应用程序组件中的菜单项也定义进来，这种方式有点麻烦，但好处是可以完全控制菜单结构。

- 在 **Composite mode** 中，菜单除了包含当前项目的 `web-menu.xml` 中的菜单项，还包含所有应用程序组件的菜单配置文件中的菜单项。这种模式可以很方便地包含所有继承的菜单项，可以在菜单结构的任何位置插入当前项目需要的菜单项。继承的菜单项不能被修改。

  此外，在 **Text** 选项卡上，可以为菜单项定义 `insertBefore` 或 `insertAfter` 属性。这两个属性定义了当前菜单项的插入位置。在 **Composite** 模式下，这两个属性有助于将当前项目菜单项与继承的应用程序组件菜单项组合在一起。

  例如，如果要将当前项目的菜单结构放在 *Administration* 菜单项的左侧，可以为当前项目的菜单树的根菜单项设置属性 `insertBefore="administration"`。

菜单配置文件列表通过 [cuba.menuConfig](https://doc.cuba-platform.com/manual-7.0-chs/app_properties_reference.html#cuba.menuConfig) 应用程序属性定义，选择菜单模式时会更新此属性。

要添加菜单项，选择已有的菜单项（或配置文件以创建顶级菜单），然后单击 ![+](https://doc.cuba-platform.cn/studio-chs/img/plus_button.png)。菜单项编辑窗口会在模式窗口中打开。

可以创建以下类型的菜单项：

- Screen - 界面

  ![web menu create](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/web_menu_create.png)用于打开应用程序界面的菜单项。应该为 **Screen** 项指定以下属性：**Screen** - 这个菜单项打开的界面的非唯一 ID。**Id** - 为菜单项指定任意唯一 ID。**Open type** - 定义界面打开的方式，可以在新的选项卡打开，或者以模态窗的方式打开（`NEW_TAB` 或 `DIALOG`）。默认使用 `NEW_TAB`。**Shortcut** - 用于打开界面的快捷键。可选的组合键（ALT、CTRL、SHIFT）用“-”分隔，例如 ALT-C。**Style name** - 定义菜单项的样式名称。有关详细信息，请参阅 [主题](https://doc.cuba-platform.com/manual-7.0-chs/gui_themes.html)。

- Menu - 菜单

  ![web menu create 2](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/web_menu_create_2.png)包含其它菜单项（子菜单）的菜单项。需要为 **Menu** 项指定以下属性：**Id** - 为菜单项指定任意唯一 ID。**Style name** - 定义菜单项的样式名称。

- Bean

  ![web menu create 3](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/web_menu_create_3.png)调用 [托管 Bean](https://doc.cuba-platform.com/manual-7.0-chs/managed_beans.html) 方法的菜单项。需要为 **Bean** 项指定以下属性：**Id** - 为菜单项指定任意唯一 ID。**Bean** - 可以通过 `AppBeans` 获取到的 bean 的名称（例如 `cuba_Messages`）。**Bean method** - 要调用的 bean 的方法名称。**Shortcut** - 用于方法调用的快捷键。可选的组合键（ALT、CTRL、SHIFT），用“-”分隔，例如 ALT-C。**Style name** - 定义菜单项的样式名称。

- Class - 类

  ![web menu create 4](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/web_menu_create_4.png)执行给定类的 `run()` 方法的菜单项。需要为 **Class** 项指定以下属性：**Id** - 为菜单项指定任意唯一 ID。**Class** - 一个类的完全限定名，这个类需实现 `Runnable` 接口。**Shortcut** - 用于方法调用的快捷键。可选的组合键（ALT 、CTRL 、SHIFT），用“-”分隔，例如 ALT-C。**Style name** - 定义菜单项的样式名称。

- Separator - 分隔符

  分隔菜单项的水平线。

#### [5.4.5. 使用主题](https://doc.cuba-platform.cn/studio-chs/#generic_ui_themes)

Studio 可以帮助在项目中创建 [主题](https://doc.cuba-platform.com/manual-7.0-chs/gui_themes.html) 扩展和自定义主题。

![theme extension](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/theme_extension.png)

创建主题扩展或自定义主题时，会创建特定目录结构并修改 `build.gradle` 文件。

创建的主题会显示在项目树的 **Themes** 部分中。

![halo ext](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/halo_ext.png)

扩展或创建主题后，可以在 SCSS 文件或可视化编辑器中手动修改其变量： 在新主题的右键菜单中，选择 **Open Variables File**。此文件也可以通过 CUBA 主菜单：选择 **Advanced > Manage themes > Edit theme variables**。

![theme variables](https://doc.cuba-platform.cn/studio-chs/img/features/generic_ui/theme_variables.png)
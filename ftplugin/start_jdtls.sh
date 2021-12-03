#!/usr/bin/env bash

java -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -javaagent:$HOME/.m2/repository/org/projectlombok/lombok/1.18.20/lombok-1.18.20.jar \
  -Xbootclasspath/a:$HOME/.m2/repository/org/projectlombok/lombok/1.18.20/lombok-1.18.20.jar \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms8G \
  -Xmx16G \
  --add-modules=ALL-SYSTEM \
  --add-opens \
  java.base/java.util=ALL-UNNAMED \
  --add-opens \
  java.base/java.lang=ALL-UNNAMED \
  -jar \
  /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar \
  -configuration \
  /home/pglandon/.local/lsp/jdtls/config/config_linux \
  -data \
  /home/pglandon/.local/lsp/jdtls/workspaces/taas_api


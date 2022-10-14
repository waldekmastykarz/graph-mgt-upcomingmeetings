#!/usr/bin/env bash

# login
echo "Sign in to Microsoft 365..."
npx -p @pnp/cli-microsoft365 -- m365 login --authType browser

# create AAD app
echo "Creating AAD app..."
appInfo=$(npx -p @pnp/cli-microsoft365 -- m365 aad app add --name "MGT Upcoming Meetings" --redirectUris "http://localhost,http://localhost/index.html" --platform spa --query "join(',', [appId,tenantId])" -o text)
appId=$(echo $appInfo | cut -d',' -f1)
tenantId=$(echo $appInfo | cut -d',' -f2)

# write app to env.js
echo "Writing app to env.js..."
echo "const appId = '$appId';" > env.js
echo "const tenantId = '$tenantId'" >> env.js

echo "DONE"

#!/bin/bash
# 一鍵推送到 GitHub 腳本 - 由蝦仔製作 🦐

set -e

echo "========================================"
echo "🦐 蝦仔幫你推上 GitHub"
echo "========================================"
echo ""

# 顏色設定
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 檢查 GitHub Token
if [ -z "$GITHUB_TOKEN" ]; then
    echo -e "${YELLOW}⚠️  需要提供 GitHub Token${NC}"
    echo ""
    echo "請跟隨以下步驟："
    echo "1. 去 https://github.com/settings/tokens/new"
    echo "2. Note: 填 'P5 Quiz Deploy'"
    echo "3. 揀選 'repo' (全部打勾)"
    echo "4. 撳 Generate token"
    echo "5. 複製個 token"
    echo ""
    read -p "貼上你嘅 GitHub Token: " GITHUB_TOKEN
    echo ""
fi

# 檢查 username
if [ -z "$GITHUB_USERNAME" ]; then
    read -p "你嘅 GitHub Username: " GITHUB_USERNAME
    echo ""
fi

REPO_NAME="p5-english-quiz"

echo -e "${BLUE}📝 步驟 1/4: 創建 GitHub Repository...${NC}"

# 用 API 創建 repo
curl -s -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d "{\"name\":\"$REPO_NAME\",\"private\":false,\"auto_init\":false}" > /tmp/repo_create.json

if grep -q '"id"' /tmp/repo_create.json; then
    echo -e "${GREEN}✅ Repository 創建成功!${NC}"
else
    if grep -q 'already exists' /tmp/repo_create.json; then
        echo -e "${YELLOW}⚠️  Repository 已存在，繼續推送...${NC}"
    else
        echo -e "${RED}❌ 創建失敗${NC}"
        cat /tmp/repo_create.json
        exit 1
    fi
fi

echo ""
echo -e "${BLUE}📝 步驟 2/4: 設定 Git Remote...${NC}"

cd /root/.openclaw/workspace/projects/vocabulary-quiz

# 設定 remote (用 token 認證)
git remote remove origin 2>/dev/null || true
git remote add origin "https://$GITHUB_USERNAME:$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo -e "${GREEN}✅ Remote 設定完成${NC}"

echo ""
echo -e "${BLUE}📝 步驟 3/4: 推送到 GitHub...${NC}"

git branch -M main
git push -u origin main --force

echo -e "${GREEN}✅ 推送成功!${NC}"

echo ""
echo -e "${BLUE}📝 步驟 4/4: 啟用 GitHub Pages...${NC}"

# 啟用 GitHub Pages
curl -s -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pages \
    -d '{"source":{"branch":"main","path":"/"}}' > /tmp/pages_enable.json

sleep 2

# 檢查 Pages 狀態
PAGES_URL=$(curl -s \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pages 2>/dev/null | grep -o '"html_url":"[^"]*"' | cut -d'"' -f4)

if [ ! -z "$PAGES_URL" ]; then
    echo -e "${GREEN}✅ GitHub Pages 已啟用!${NC}"
else
    echo -e "${YELLOW}⚠️  請手動啟用 GitHub Pages${NC}"
fi

echo ""
echo "========================================"
echo -e "${GREEN}🎉 部署完成！${NC}"
echo "========================================"
echo ""
echo "📋 資訊："
echo "   Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
if [ ! -z "$PAGES_URL" ]; then
    echo "   網站網址: $PAGES_URL"
else
    echo "   網站網址: https://$GITHUB_USERNAME.github.io/$REPO_NAME/ (等2-3分鐘)"
fi
echo ""
echo -e "${YELLOW}⏰ 等 2-3 分鐘後網站就可以開到${NC}"
echo ""
echo "🦐 蝦仔幫你搞掂晒！"
echo ""

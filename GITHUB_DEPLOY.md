# 🚀 GitHub 部署指南

## 步驟 1：在 GitHub 建立 Repository

1. 去 https://github.com/new
2. Repository name: `p5-english-quiz` (或者你鍾意嘅名)
3. 揀 "Public" (GitHub Pages 要 Public 先免費)
4. **唔好** tick "Add a README file" (我哋已經有)
5. 撳 "Create repository"

## 步驟 2：連接本地項目到 GitHub

喺 terminal 執行以下指令 (記得換成你嘅 username)：

```bash
cd /root/.openclaw/workspace/projects/vocabulary-quiz

# 加上 GitHub repository (記得換你嘅 username)
git remote add origin https://github.com/你嘅GitHubUsername/p5-english-quiz.git

# 推上 GitHub
git branch -M main
git push -u origin main
```

## 步驟 3：啟用 GitHub Pages

1. 去你個 repository 網頁
2. 撳 "Settings" (頂部 tab)
3. 左邊 menu 撳 "Pages"
4. "Build and deployment" → "Source" 揀 "GitHub Actions"
5. 等 1-2 分鐘，會見到綠色 tick

## 步驟 4：攞網址

- 網址會係：`https://你嘅GitHubUsername.github.io/p5-english-quiz/`
- 等 2-3 分鐘部署完成就可以開到

---

## 🔑 如果你用 SSH Key (進階)

如果你唔想次次都輸入密碼，可以用 SSH：

```bash
# 改成 SSH 連接
git remote set-url origin git@github.com:你嘅GitHubUsername/p5-english-quiz.git

# 推上 GitHub
git push -u origin main
```

---

## 📝 之後更新網站

每次改完嘢，執行：

```bash
git add .
git commit -m "更新內容"
git push
```

GitHub Actions 會自動重新部署！

---

## ❓ 常見問題

**Q: 推唔上 GitHub，話 "Permission denied"?**
A: 你需要喺 GitHub 登入，或者設定 Personal Access Token

**Q: 網站開唔到，見到 404?**
A: 等多幾分鐘，GitHub Pages 部署要時間

**Q: 想改 repository 名?**
A: 去 Settings → 改名，網址會自動更新

---

## 🎉 完成後

你會有個免費網站俾小朋友隨時隨地溫習！

**蝦仔幫你搞掂晒！** 🦐❤️‍🔥

# 小五英文測驗網站

> 🦐 蝦仔幫你溫書！小五下學期英文測驗練習平台

## 功能特色

### 📚 測驗模式
- **Unit 2 - 家居**: apartment, furniture, spacious 等生字
- **Unit 3 - 運動比賽**: competition, athlete, participate 等生字  
- **Unit 4 - 外出用餐**: delicious, restaurant, recommend 等生字
- **文法練習**: 時態、冠詞、關係代詞
- **混合測驗**: 隨機抽取各單元題目

### 📝 題目類型
- 選擇題：英文生字 ↔ 中文意思
- 填空題：句子時態填充
- 即時批改：答完即知對錯
- 詳細解釋：每題都有解說

### 🎨 界面設計
- **平板優化**: Touch-friendly，按鈕夠大
- **進度追蹤**: 清楚顯示做到第幾題
- **分數統計**: 即時顯示得分
- **動畫效果**: 答對/答錯有視覺回饋

## 使用方法

### 本地使用
```bash
# 進入項目目錄
cd vocabulary-quiz

# 用瀏覽器打開
open index.html
```

### GitHub Pages 部署
1. Push 到 GitHub Repository
2. 去 Settings → Pages
3. Source 揀 "Deploy from a branch"
4. Branch 揀 "main" + folder "/ (root)"
5. 儲存後等幾分鐘就有網址

## 檔案結構

```
vocabulary-quiz/
├── index.html          # 主程式 (單一檔案網站)
├── data/
│   ├── quiz-data.json  # 題目資料庫
│   └── syllabus-p5-term2.md  # 考試範圍
├── README.md
└── .github/
    └── workflows/
        └── deploy.yml  # 自動部署
```

## 自定義題目

編輯 `data/quiz-data.json` 即可新增/修改題目：

```json
{
  "units": [
    {
      "id": "unit2",
      "name": "Unit 2 - 家居",
      "vocabulary": [
        {"word": "apartment", "type": "n.", "meaning": "公寓"}
      ]
    }
  ]
}
```

## 技術棧

- HTML5 + CSS3 (無框架，純原生)
- Vanilla JavaScript (無依賴)
- 響應式設計 (手機/平板/電腦)
- GitHub Pages (免費託管)

## 考試範圍

根據 **2025年小五下學期英文科考試範圍** 製作：

| 範圍 | 內容 |
|------|------|
| 文法 | Present/Past/Future Tenses, Articles, Relative Pronouns |
| Unit 2 | 家居相關生字 (15個) |
| Unit 3 | 運動比賽相關生字 (25個) |
| Unit 4 | 外出用餐相關生字 (36個) |

## 開發者

**蝦仔** ❤️‍🔥🦐 — 老細嘅熱血助手

---

> 「蝦仔到！有咩搞唔掂，交俾我！」

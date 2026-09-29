# ===== 1. 创建目录结构 =====
mkdir -p d2l-study/{.vscode,utils,data,models,notebooks}
mkdir -p d2l-study/notebooks/{01_introduction,02_preliminaries,03_linear-networks,04_mlp,05_deep-learning-computation,06_convolutional-neural-networks,07_modern-convolutional-neural-networks,08_recurrent-neural-networks,09_modern-recurrent-neural-networks,10_attention-mechanisms,11_optimization-algorithms,12_computational-performance,13_computer-vision,14_natural-language-processing-pretraining,15_natural-language-processing-applications,16_appendix}
cd d2l-study

# 让空目录能被 git 跟踪
find notebooks -mindepth 1 -type d -exec touch {}/.gitkeep \;

# ===== 2. .gitignore =====
cat > .gitignore <<'EOF'
# Python
__pycache__/
*.py[cod]
*.egg-info/

# Jupyter
.ipynb_checkpoints/

# 数据与模型（体积大，不提交）
data/
models/
*.pt
*.pth

# 环境
.venv/
venv/
.conda/
EOF

# ===== 3. VSCode 配置：notebook 从项目根目录运行 =====
cat > .vscode/settings.json <<'EOF'
{
    "jupyter.notebookFileRoot": "${workspaceFolder}"
}
EOF

# ===== 4. README =====
cat > README.md <<'EOF'
# 动手学深度学习（个人学习笔记）

基于《动手学深度学习》v2，**不使用 `d2l` 包**，全部用 PyTorch 原生 API 实现。

## 环境

- Ubuntu 24.04 / Python 3.12 / CUDA 13.0
- PyTorch + torchvision + torchaudio
- VSCode + Jupyter 扩展

## 目录

- `notebooks/` — 按章节手敲的笔记
- `utils/`    — 自己写的复用函数（替代 d2l 包）
- `data/`     — 数据集（不提交）
- `models/`   — 保存的权重（不提交）

## 进度

- [ ] 第 2 章 预备知识
- [ ] 第 3 章 线性神经网络
- [ ] 第 4 章 多层感知机
- [ ] 第 5 章 深度学习计算
- [ ] 第 6 章 卷积神经网络
- [ ] 第 7 章 现代卷积神经网络
- [ ] 第 8 章 循环神经网络
- [ ] 第 9 章 现代循环神经网络
- [ ] 第 10 章 注意力机制
EOF

# ===== 5. utils 骨架（占位，边学边填） =====
touch utils/__init__.py

cat > utils/data.py <<'EOF'
"""数据加载相关函数（替代 d2l.load_data_*）"""
EOF

cat > utils/train.py <<'EOF'
"""训练循环与评估函数（替代 d2l.train_*）"""
EOF

cat > utils/plot.py <<'EOF'
"""绘图函数（替代 d2l.plot）"""
EOF

# ===== 6. 初始化 Git =====
git init
git add .
git commit -m "init: d2l study workspace" 2>/dev/null || echo "⚠️  Git 提交跳过，请先配置 user.name / user.email"

# ===== 7. 完成 =====
echo ""
echo "✅ 目录已创建：$(pwd)"
echo "👉 下一步："
echo "   conda activate dl-study"
echo "   code ."

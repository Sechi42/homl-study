# GitHub Copilot Instructions — HOML Study Repo

## Context & Goal

This repository is a **personal study companion** for the book  
*Hands-On Machine Learning with Scikit-Learn, Keras & PyTorch* by Aurélien Géron (2025 edition).

The objective is to read each chapter, reproduce and extend the examples, build intuition, and write clean, well-documented code. Copilot should actively help with that learning process.

---

## Project Layout

```
homl-study/
├── data/                          ← All datasets live here (shared across chapters)
├── 01_the_machine_learning_landscape/
│   └── 01_the_machine_learning_landscape.ipynb
├── 02_end_to_end_machine_learning_project/
│   └── ...
...
└── 19_reinforcement_learning/
    └── 19_reinforcement_learning.ipynb
```

**Key convention:** every notebook accesses shared data via the relative path `../data/`.  
Never hard-code absolute paths.

---

## Copilot Behaviour Guidelines

### 1. Teaching-First Approach
- Prefer **clear, readable code** over brevity. Favour explicit variable names and step-by-step logic.
- Add **inline comments** that explain *why*, not just *what*.
- When implementing a concept from the book, include a short docstring or markdown cell that anchors it to the chapter topic.

### 2. Data Loading Convention
Always use `pathlib.Path` and `../data/` relative paths:
```python
from pathlib import Path
DATA_PATH = Path("../data")
df = pd.read_csv(DATA_PATH / "dataset_name.csv")
```

### 3. Code Style
- Python 3.10+ syntax (match-case, `|` union types, etc.)
- Use `f-strings`, not `.format()` or `%`.
- Prefer `numpy`, `pandas`, `scikit-learn`, `matplotlib`/`seaborn`, and `torch` / `torchvision` / `transformers`.
- Each notebook cell should do **one** logical thing.

### 4. ML / Deep Learning Best Practices
- Always set a random seed where reproducibility matters: `np.random.seed(42)`, `torch.manual_seed(42)`.
- Use scikit-learn **pipelines** (`Pipeline`, `ColumnTransformer`) rather than scattered preprocessing.
- When writing PyTorch code, prefer `nn.Module` subclasses over procedural scripts.
- Log metrics during training (loss + validation metric per epoch minimum).
- Use `device = torch.device("cuda" if torch.cuda.is_available() else "cpu")` for hardware portability.

### 5. Notebook Structure
Suggested cell order for each chapter notebook:
1. Markdown title & chapter summary (already in the template).
2. Imports.
3. Data loading (`../data/`).
4. EDA / visualisation.
5. Model definition.
6. Training / fitting.
7. Evaluation & interpretation.
8. Experiments & personal notes.

### 6. Do NOT
- Hard-code absolute paths.
- Use deprecated scikit-learn APIs — prefer the latest stable API.
- Generate large amounts of boilerplate without explaining it.
- Skip error handling when loading data or training models.

---

## Vocabulary / Domain Context

When mentioning or generating code for these topics, assume the book's notation:
- **RMSE**, **MSE**, **MAE** for regression metrics.
- **Precision**, **Recall**, **F1**, **ROC-AUC** for classification.
- `X_train`, `X_val`, `X_test`, `y_train`, `y_val`, `y_test` naming convention.
- `model.fit()` / `model.predict()` for scikit-learn.
- `model.forward()` / `loss.backward()` / `optimizer.step()` for PyTorch.

---

## Chapter Reference

| # | Chapter |
|---|---------|
| 01 | The Machine Learning Landscape |
| 02 | End-to-End Machine Learning Project |
| 03 | Classification |
| 04 | Training Linear Models |
| 05 | Decision Trees |
| 06 | Ensemble Learning and Random Forests |
| 07 | Dimensionality Reduction |
| 08 | Unsupervised Learning |
| 09 | Artificial Neural Networks |
| 10 | Neural Nets with PyTorch |
| 11 | Training Deep Neural Networks |
| 12 | Deep Computer Vision with CNNs |
| 13 | Processing Sequences Using RNNs and CNNs |
| 14 | NLP with RNNs and Attention |
| 15 | Transformers for NLP and Chatbots |
| 16 | Vision and Multimodal Transformers |
| 17 | Speeding Up Transformers |
| 18 | Autoencoders, GANs, and Diffusion Models |
| 19 | Reinforcement Learning |

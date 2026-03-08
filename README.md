# Hands-On Machine Learning with Scikit-Learn and PyTorch — Study Repo

> Personal study notes and code for **Aurélien Géron's** book  
> *Hands-On Machine Learning with Scikit-Learn, Keras & PyTorch* (2025 edition)

---

## 📁 Repository Structure

```
homl-study/
├── data/                          ← Shared datasets (all chapters use ../data/)
│
├── 01_the_machine_learning_landscape/
│   └── 01_the_machine_learning_landscape.ipynb
├── 02_end_to_end_machine_learning_project/
│   └── 02_end_to_end_machine_learning_project.ipynb
├── 03_classification/
│   └── 03_classification.ipynb
├── 04_training_linear_models/
│   └── 04_training_linear_models.ipynb
├── 05_decision_trees/
│   └── 05_decision_trees.ipynb
├── 06_ensemble_learning_and_random_forests/
│   └── 06_ensemble_learning_and_random_forests.ipynb
├── 07_dimensionality_reduction/
│   └── 07_dimensionality_reduction.ipynb
├── 08_unsupervised_learning/
│   └── 08_unsupervised_learning.ipynb
├── 09_artificial_neural_networks/
│   └── 09_artificial_neural_networks.ipynb
├── 10_neural_nets_with_pytorch/
│   └── 10_neural_nets_with_pytorch.ipynb
├── 11_training_deep_neural_networks/
│   └── 11_training_deep_neural_networks.ipynb
├── 12_deep_computer_vision_with_cnns/
│   └── 12_deep_computer_vision_with_cnns.ipynb
├── 13_processing_sequences_using_rnns_and_cnns/
│   └── 13_processing_sequences_using_rnns_and_cnns.ipynb
├── 14_nlp_with_rnns_and_attention/
│   └── 14_nlp_with_rnns_and_attention.ipynb
├── 15_transformers_for_nlp_and_chatbots/
│   └── 15_transformers_for_nlp_and_chatbots.ipynb
├── 16_vision_and_multimodal_transformers/
│   └── 16_vision_and_multimodal_transformers.ipynb
├── 17_speeding_up_transformers/
│   └── 17_speeding_up_transformers.ipynb
├── 18_autoencoders_gans_and_diffusion_models/
│   └── 18_autoencoders_gans_and_diffusion_models.ipynb
└── 19_reinforcement_learning/
    └── 19_reinforcement_learning.ipynb
```

---

## 🗂️ Accessing Datasets

All datasets live in `data/` at the root.  
From **any** chapter notebook you can always load data with:

```python
import pandas as pd
from pathlib import Path

DATA_PATH = Path("../data")          # works from any chapter subfolder
housing  = pd.read_csv(DATA_PATH / "housing.csv")
```

---

## ⚙️ Environment Setup

### 1 — Clone & enter the repo
```bash
git clone <your-repo-url>
cd homl-study
```

### 2 — Install uv
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### 3 — Create the environment and install the notebook stack
```bash
uv sync
```

This installs the dependencies required by the current scikit-learn and Polars notebooks, including JupyterLab, Plotnine, and the Chapter 2 stack.

### 4 — Optional: install the deep learning stack for later chapters
```bash
uv sync --extra deep-learning
```

This adds PyTorch, TorchVision, TorchAudio, and Transformers for the later chapters.

### 5 — Register a Jupyter kernel
```bash
uv run python -m ipykernel install --user --name homl-study --display-name "Python (homl-study)"
```

### 6 — Launch JupyterLab
```bash
uv run jupyter lab
```

---

## 📖 Chapter Index

| # | Chapter | Topics |
|---|---------|--------|
| 01 | The Machine Learning Landscape | ML types, challenges, model selection |
| 02 | End-to-End ML Project | Pipeline, preprocessing, evaluation |
| 03 | Classification | Binary/multiclass, metrics, SVM |
| 04 | Training Linear Models | Linear/Logistic regression, regularization |
| 05 | Decision Trees | CART, depth, pruning |
| 06 | Ensemble Learning and Random Forests | Bagging, boosting, stacking |
| 07 | Dimensionality Reduction | PCA, LLE, UMAP |
| 08 | Unsupervised Learning | K-Means, DBSCAN, GMM |
| 09 | Artificial Neural Networks | Perceptron, MLP, backprop |
| 10 | Neural Nets with PyTorch | PyTorch tensors, autograd, nn.Module |
| 11 | Training Deep Neural Networks | Optimisers, BN, dropout, schedules |
| 12 | Deep Computer Vision with CNNs | Conv layers, ResNet, transfer learning |
| 13 | Processing Sequences Using RNNs and CNNs | RNN, LSTM, GRU, WaveNet |
| 14 | NLP with RNNs and Attention | Seq2Seq, attention mechanism |
| 15 | Transformers for NLP and Chatbots | BERT, GPT, fine-tuning |
| 16 | Vision and Multimodal Transformers | ViT, CLIP, DALL-E |
| 17 | Speeding Up Transformers | Distillation, quantisation, pruning |
| 18 | Autoencoders, GANs, and Diffusion Models | VAE, GAN, DDPM |
| 19 | Reinforcement Learning | MDP, Q-Learning, PPO |

---

## 🔗 Official Resources

- Book: [Aurélien Géron — Hands-On ML (O'Reilly)](https://www.oreilly.com/library/view/hands-on-machine-learning/)
- Official notebooks: [github.com/ageron/handson-ml3](https://github.com/ageron/handson-ml3)

---

## 📝 Notes

- Each chapter notebook starts clean — notes and experiments are added progressively while reading.
- Datasets that are downloaded programmatically are saved to `data/` so they are reused across chapters.

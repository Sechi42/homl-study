# ============================================================
# setup_env.ps1 — HOML Study Environment Setup
# Ejecutar en PowerShell desde la carpeta homl-study:
#   cd "C:\Users\evolu\Desktop\Master\Ml_Torch_Sklrn"
#   powershell -ExecutionPolicy Bypass -File homl-study\setup_env.ps1
# ============================================================

$PREFIX = "C:\Users\evolu\Desktop\Master\Ml_Torch_Sklrn\.conda"
$CONDA  = "C:\Users\evolu\anaconda3\Scripts\conda.exe"

Write-Host ""
Write-Host "===============================" -ForegroundColor Cyan
Write-Host " HOML Study — Environment Setup" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Prefix : $PREFIX"
Write-Host "Conda  : $CONDA"
Write-Host ""

# ── 1. Confirm conda is reachable ──────────────────────────
if (-not (Test-Path $CONDA)) {
    Write-Host "ERROR: no se encontro conda en $CONDA" -ForegroundColor Red
    Write-Host "Ajusta la variable CONDA al inicio del script."
    exit 1
}

# ── 2. Confirm the prefix exists ──────────────────────────
if (-not (Test-Path $PREFIX)) {
    Write-Host "El entorno .conda no existe. Creandolo con Python 3.12..." -ForegroundColor Yellow
    & $CONDA create --yes --prefix $PREFIX python=3.12
}

Write-Host ""
Write-Host "Paso 1/4: Instalando ipykernel (fix para VS Code)..." -ForegroundColor Yellow
& $CONDA install --yes --prefix $PREFIX ipykernel

Write-Host ""
Write-Host "Paso 2/4: Registrando el kernel de Jupyter..." -ForegroundColor Yellow
& $CONDA run --prefix $PREFIX python -m ipykernel install --user --name homl-study --display-name "HOML Study (Python 3.12)"

Write-Host ""
Write-Host "Paso 3/4: Instalando paquetes del libro (via pip)..." -ForegroundColor Yellow
# Basado en pyproject.toml de https://github.com/ageron/handson-mlp

$packages = @(
    # Core
    "numpy>=2.3.3,<3.0.0",
    "pandas>=2.3.3,<3.0.0",
    "polars>=1.0.0",
    "scipy>=1.16.2,<2.0.0",
    "matplotlib>=3.10.6,<4.0.0",
    "seaborn",
    "numexpr>=2.13.1,<3.0.0",
    "joblib>=1.5.2,<2.0.0",
    "tqdm>=4.67.1,<5.0.0",
    "pillow>=11.3.0,<12.0.0",
    "requests>=2.32.5,<3.0.0",

    # Jupyter
    "jupyterlab>=4.4.9,<5.0.0",
    "notebook",
    "ipywidgets",
    "widgetsnbextension>=4.0.14,<5.0.0",
    "nbdime>=4.0.2,<5.0.0",

    # Machine Learning
    "scikit-learn>=1.7.2,<2.0.0",
    "xgboost>=3.0.5,<4.0.0",
    "optuna>=4.5.0,<5.0.0",
    "statsmodels>=0.14.5,<0.15.0",
    "graphviz>=0.21,<0.22",

    # PyTorch (CPU — si tienes GPU cambia a la URL de CUDA)
    "torch>=2.8.0,<3.0.0",
    "torchvision>=0.23.0,<0.24.0",
    "torchaudio>=2.8.0,<3.0.0",
    "torchmetrics>=1.8.2,<2.0.0",
    "accelerate>=1.10.1,<2.0.0",

    # NLP & Transformers
    "transformers>=4.57.0,<5.0.0",
    "datasets>=4.1.1,<5.0.0",
    "sentence-transformers>=5.1.1,<6.0.0",
    "sentencepiece>=0.2.1,<0.3.0",
    "nltk>=3.9.2,<4.0.0",
    "einops>=0.8.1",
    "peft>=0.17.1,<0.18.0",
    "trl>=0.23.1,<0.24.0",

    # RL
    "gymnasium[atari]>=1.2.1,<2.0.0",
    "stable-baselines3>=2.7.0,<3.0.0",
    "ale-py>=0.11.2",
    "pygame>=2.6.1,<3.0.0",

    # CV & Generation
    "diffusers>=0.35.1,<0.36.0",
    "ultralytics>=8.3.206,<9.0.0",

    # Misc
    "tensorboard>=2.20.0,<3.0.0",
    "onnx>=1.19.0,<2.0.0",
    "packaging",
    "urlextract>=1.9.0,<2.0.0",
    "soundfile>=0.13.1"
)

$packageStr = $packages -join " "
& $CONDA run --prefix $PREFIX pip install $packageStr

Write-Host ""
Write-Host "Paso 4/4: Instalando polars extras..." -ForegroundColor Yellow
& $CONDA run --prefix $PREFIX pip install "polars[all]"

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host " ¡Listo! Entorno configurado correctamente." -ForegroundColor Green
Write-Host ""
Write-Host "Para verificar:" -ForegroundColor Cyan
Write-Host "  conda run --prefix $PREFIX python -c `"import torch; print('torch', torch.__version__)`""
Write-Host "  conda run --prefix $PREFIX python -c `"import sklearn; print('sklearn', sklearn.__version__)`""
Write-Host "  conda run --prefix $PREFIX python -c `"import polars; print('polars', polars.__version__)`""
Write-Host ""
Write-Host "En VS Code selecciona el kernel:" -ForegroundColor Cyan
Write-Host "  'HOML Study (Python 3.12)'"
Write-Host "================================================" -ForegroundColor Green

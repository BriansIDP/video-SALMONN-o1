# video-SALMONN-o1

## Abstract
While recent advancements in reasoning optimization have significantly enhanced the capabilities of large language models (LLM), existing efforts to improve reasoning have been limited to solving mathematical problems and focusing on visual graphical inputs, neglecting broader applications in general video understanding.
This paper proposes video-SALMONN-o1, the first open-source reasoning-enhanced audio-visual LLM designed for general video understanding tasks. To enhance its reasoning abilities, we develop a reasoning-intensive dataset featuring challenging audio-visual questions with step-by-step solutions. We also propose the process direct preference optimization (DPO), which leverages contrastive step selection to achieve efficient step-level reward modeling tailored for multimodal inputs. 
Additionally, we introduce AVRBench, the first comprehensive audio-visual reasoning benchmark, featuring over 4,000 high-quality, expert-curated question-answer pairs across scenarios such as standup comedy, academic presentations, and synthetic video detection. video-SALMONN-o1 achieves 3-8% accuracy improvements over the LLaVA-OneVision baseline across different video reasoning benchmarks. Besides, process DPO achieves 6-8% improvements compared to the SFT-only model. Furthermore, enhanced reasoning enables video-SALMONN-o1 zero-shot synthetic video detection capabilities.

## Demo Videos
[Figure 13 Video](https://www.youtube.com/watch?v=-9d7fwlIzDk)

[Figure 14 Video](https://www.youtube.com/watch?v=4V6G0qYVoBg)

[Figure 15 Video](https://www.youtube.com/watch?v=WmVLcj-XKnM)

[Figure 16 Video](video/synth_1.mp4)

[Figure 17 Video](video/synth_2.mp4)

[Figure 18 Video](video/nextqa_1.mp4)

## Model Checkpoint
Coming soon...

## Training
Coming soon...

## Inference
Coming soon...

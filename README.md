# video-SALMONN-o1

## Abstract
While recent advancements in reasoning optimization have significantly enhanced the capabilities of large language models (LLM), existing efforts to improve reasoning have been limited to solving mathematical problems and focusing on visual graphical inputs, neglecting broader applications in general video understanding.
This paper proposes video-SALMONN-o1, the first open-source reasoning-enhanced audio-visual LLM designed for general video understanding tasks. To enhance its reasoning abilities, we develop a reasoning-intensive dataset featuring challenging audio-visual questions with step-by-step solutions. We also propose the process direct preference optimization (DPO), which leverages contrastive step selection to achieve efficient step-level reward modeling tailored for multimodal inputs. 
Additionally, we introduce AVRBench, the first comprehensive audio-visual reasoning benchmark, featuring over 4,000 high-quality, expert-curated question-answer pairs across scenarios such as standup comedy, academic presentations, and synthetic video detection. video-SALMONN-o1 achieves 3-8% accuracy improvements over the LLaVA-OneVision baseline across different video reasoning benchmarks. Besides, process DPO achieves 6-8% improvements compared to the SFT-only model. Furthermore, enhanced reasoning enables video-SALMONN-o1 zero-shot synthetic video detection capabilities.

### Process DPO and Contrastive Rollout
<img src="images/contrastiverollout.jpg" width="600">

## Demo Videos
---
[Figure 13 Video](video/standup_1.mp4)

**Question**:
What does the speaker imply by saying he 'didn't need to know that' at the end of the video? Choose from:\
A. He regrets ordering so much food.\
B. When you want to eat, just eat and don't prioritize calories.\
C. He doesn't like knowing calorie counts of food.\
D. He feels guilty about his food choices.\
E. The calorie count was surprisingly low.\
Answer the question step by step. Output each thinking step. 

**Reasoning**:
1. The The speaker is making a joke about how fast food restaurants use calorie counts to manipulate customers into buying more food.
2. He says he didn't need to know that because he already knew he was going to eat a lot of calories.
3. His tone and delivery suggest he's not actually upset about the calorie count, but rather finds it humorous that he doesn't need to be told how unhealthy his choices are. (Combining audio-visual information)
4. Therefore, the speaker implies that when you want to eat, just eat and don't prioritize calories.
5. The answer is B

---
[Figure 14 Video](video/videomme_1.mp4)

**Question**:
What is on the legend when he is hit by the turret? Choose from:\
A. Sand.\
B. Ice.\
C. Thunder.\
D. Fire.\
Answer the question step by step.

**Reasoning**:
1. The question asks about the legend when he is hit by the turret.
2. The legend is a character in the game, and turrets are structures that fire at characters.
3. The legend is hit by a turret at around 0:15 seconds into the video.
4. When the legend is hit by the turret, there is a burst of fire.
5. Therefore, the answer is **D. Fire**.

---
[Figure 15 Video](video/videomme_2.mp4)

**Question**:
Which of the following elements does not appear in the video? Choose from:\
A. Iceberg.\
B. Moon.\
C. Earth.\
D. River.\
Answer the question step by step.

**Reasoning**:
1. The question asks which element is not present in the video.
2. We need to carefully watch the video and identify all the elements shown.
3. The video shows various natural landscapes like mountains, waterfalls, forests, deserts, oceans, and a view from space.
4. However, the video does not show the moon.
5. Therefore, the answer is **B. Moon**.

---
[Figure 16 Video](video/synth_1.mp4)

**Question**:
An AI-generated video contains unnatural distorted things, such as distorted hands or faces. Is the given video AI generated? Answer YES or NO. Answer step by step and output each step clearly.

**Reasoning**:
1. The video shows a man running towards a train, then collapsing in pain. 
2. The background is blurred and the colors are distorted, suggesting motion blur.
3. AI-generated videos often use techniques like motion blur to create a sense of speed or urgency. 
4. This can sometimes result in unnatural distortions in the image.
5. In this case, the blurring and distortion are more pronounced than what would be expected from natural camera shake or movement. 
6. The hands of the man appear particularly distorted, which is not typical for real-life footage.
7. Therefore, based on the visual cues of the video, it is likely that the video is AI generated. 
8. So the answer is YES.

---
[Figure 17 Video](video/synth_2.mp4)

**Question**:
An AI-generated video contains unnatural distorted things, such as distorted hands or faces. Is the given video AI generated? Answer YES or NO. Answer step by step and output each step clearly.

**Reasoning**:
1. The video shows a cyclist riding on a road with a field of flowers in the background. 
2. The colors are vibrant and the scene is smooth, suggesting it might be AI generated.
3. Upon closer inspection, we can see that the cyclist's shadow is perfectly aligned with the cyclist, which is unusual for a moving object. This suggests a lack of natural motion blur or distortion, a common characteristic of AI-generated videos.
4. Therefore, based on the smoothness of the scene and the unnatural alignment of the cyclist's shadow, it is highly likely that the video is AI generated. 
5. So the answer is YES.

## Model Checkpoint
Coming soon...

## Training
Coming soon...

## Inference
Coming soon...

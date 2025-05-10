#!/bin/bash

# Some specific versions
# pip install ffmpeg-python
# pip install transformers==4.39.2
# pip install accelerate==0.28.0

export HF_HOME="/mnt/bn/tiktok-mm-2/aiic/public/model/huggingface" # Change to your own path
TEST_OUTPUT=output/PRMDPO_with_caption_qa_prev_newdata_MCQsubset_withceloss_videomme
MODEL_PATH=/mnt/bn/tiktok-mm-4/aiic/users/guangzhisun/llava-video/output/models/PRMDPO_with_caption_qa_prev_newdata_MCQsubset_withceloss/checkpoint_12000_qwen
TEST_DATA=/mnt/bn/tiktok-mm-2/aiic/users/guangzhisun/dataprep/preprocessed_data/videomme_audiovisual_test_reasoning.json
VISION_ENCODER=google/siglip-so400m-patch14-384
WHISPER_PATH=/mnt/bn/tiktok-mm-2/aiic/public/model/whisper-large-v3

python3 inference.py \
    --test_output_dir $TEST_OUTPUT \
    --model_name_or_path $MODEL_PATH \
    --output_dir $TEST_OUTPUT \
    --test_data_path $TEST_DATA \
    --vision_tower $VISION_ENCODER \
    --image_processor $VISION_ENCODER \
    --image_grid_pinpoints "[(384, 768), (768, 384), (768, 768), (1152, 384), (384, 1152)]" \
    --whisper_path $WHISPER_PATH \
    --audio_processor $WHISPER_PATH \
    --bf16 True \
    --tf32 True \
    --dataloader_num_workers 16 \

# echo "All parameters: $@"

# # SET ENV
# # source /mnt/bn/tiktok-mm-2/miniconda3/etc/profile.d/conda.sh
# # conda activate llava

# # export NCCL_P2P_LEVEL=NVL
# # export NCCL_P2P_DISABLE=1
# # export TOKENIZERS_PARALLELISM=false

# export NCCL_MIN_NRINGS=32
# export NCCL_IB_TIMEOUT=23
# export NCCL_IB_QPS_PER_CONNECTION=5
# export NCCL_MAX_CTAS=8


# echo "Detected H100 GPU. No need to activate conda environment."
# pip3 install -r /opt/tiger/llava-video/pandagpt_requirements.txt
# sudo apt-get update
# sudo apt-get install -y ffmpeg
# pip install ffmpeg-python
# pip install trl
# pip install transformers==4.39.2
# pip install accelerate==0.28.0
# # export HF_HOME='/opt/tiger'

# PROJECT_ROOT=$(cd $(dirname $0); pwd)
# # PROJECT_ROOT=/mnt/bn/tiktok-mm-2/aiic/users/tangchangli/llava-video
# cd $PROJECT_ROOT

# # SET VISIBLE GPU DEVICES
# # export CUDA_VISIBLE_DEVICES="0,1, 2, 3"


# ports=(`echo $METIS_WORKER_0_PORT | tr ',' ' '`)
# port=${ports[0]}

# TEST_DATA_PATH=/mnt/bn/tiktok-mm-2/aiic/users/guangzhisun/dataprep/preprocessed_data/videomme_audiovisual_test_reasoning.json
# TEST_ID=debug
# MODEL_ID=/mnt/bn/tiktok-mm-4/aiic/users/guangzhisun/llava-video/output/models/PRMDPO_with_caption_qa_prev_newdata_MCQsubset_withceloss/checkpoint_12000_qwen
# MODEL_BASE=/mnt/bn/tiktok-mm-4/aiic/users/guangzhisun/llava-video/output/models/PRMDPO_with_caption_qa_prev_newdata_MCQsubset_withceloss/checkpoint_12000_qwen
# LOAD_FROM_LORA=False # True # 

# LR=2e-5

# MAX_TIME=30 # 30
# FPS=2

# LORA_LLM_ONLY=False
# WHISPER_LORA=False
# FLASH_ATTN=False
# PREDICTION_LOSS_ONLY=False
# CKPT=None

# MULTI_FRAME_PROJECTOR=False
# MULTI_FRAME_NUM=30
# ADD_TIME_TOKEN=True
# INSERT_TIME_PRECISION=0
# MAX_NEW_TOKENS=1024
# USE_MFCNN=False
# USE_MFTRANS=False
# USE_FLASH_TOWER=True
# INCLUDE_TIME_PROMPT=False
# LORA_ENABLE=False
# LORA_R=128
# LORA_ALPHA=256
# LORA_DROPOUT=0.05
# PRETRAIN_WEIGHT=None
# MERGE_AND_RELOAD=False
# DO_REASONING=True
# DO_SAMPLE=False
# BEAM=1
# ROLLOUT=none
# CONTRASTIVE=none
# USE_DORA=False
# MM_POOLING_POSITION=before
# INTERP_FACTOR=0.0
# while [[ "$#" -gt 0 ]]; do
#     case $1 in
#         --test_data) TEST_DATA_PATH="$2"; shift ;;
#         --test_id) TEST_ID="$2"; shift ;;
#         --model) MODEL_ID="$2"; shift ;;
#         --load_from_lora) LOAD_FROM_LORA=True; ;;
#         --max_time) MAX_TIME="$2"; shift ;;
#         --fps) FPS="$2"; shift ;;
#         --lora_llm_only) LORA_LLM_ONLY=True; ;;
#         --flash_attn) FLASH_ATTN=True; ;;
#         --prediction_loss_only) PREDICTION_LOSS_ONLY=True; ;;
#         --ckpt) CKPT="$2"; shift ;;
#         --multi_frame_projector) MULTI_FRAME_PROJECTOR=True; ;;
#         --multi_frame_num) MULTI_FRAME_NUM="$2"; shift ;;
#         --add_time_token) ADD_TIME_TOKEN=True; ;;
#         --insert_time_precision) INSERT_TIME_PRECISION="$2"; shift ;;
#         --max_new_tokens) MAX_NEW_TOKENS="$2"; shift ;;
#         --use_mfcnn) USE_MFCNN=True; ;;
#         --use_mftrans) USE_MFTRANS=True; ;;
#         --use_flash_tower) USE_FLASH_TOWER=True; ;;
#         --include_time_prompt) INCLUDE_TIME_PROMPT=True; ;;
#         --use_lora) LORA_ENABLE=True; ;;
#         --lora_r) LORA_R="$2"; shift ;;
#         --lora_alpha) LORA_ALPHA="$2"; shift ;;
#         --lora_dropout) LORA_DROPOUT="$2"; shift ;;
#         --model_base) MODEL_BASE="$2"; shift ;;
#         --merge_and_reload) MERGE_AND_RELOAD=True; ;;
#         --do_sample) DO_SAMPLE=True; ;;
#         --interp_factor) INTERP_FACTOR="$2"; shift ;;
#         --do_reasoning) DO_REASONING=True; ;;
#         --contrastive) CONTRASTIVE="$2"; shift ;;
#         --beam) BEAM="$2"; shift ;;
#         --rollout) ROLLOUT="$2"; shift ;;
#         --mm_pooling_position) MM_POOLING_POSITION="$2"; shift ;;
#         --use_dora) USE_DORA=True; ;;
#         --pretrain_weight) PRETRAIN_WEIGHT="$2"; shift ;;
#         *) echo "Unknown parameter passed: $1"; exit 1 ;;
#     esac
#     shift
# done

# UNFREEZE_MM_VISION_TOWER=False
# FREEZE_BACKBONE=True
# SAVE_MODEL_NAME=debug

# EPOCHS=4 # 5
# TRAIN_BS=1 # 1 # 2
# ACCUM_STEPS=1
# SAVE_STEPS=1000 # 2000


# # ———————————————— Lines above work for all '.sh' in llave-video ————————————————

# # SET TRAINING CONFIGS
# IMAGE_FOLDER="/mnt/bn/tiktok-mm-2/aiic/public/data/image/training"
# VIDEO_FOLDER="/mnt/bn/tiktok-mm-2/aiic/public/data/video/training"

# if [ -e $TEST_DATA_PATH ]; then
#     DATA_FOLDER=$(dirname $TEST_DATA_PATH)
#     TEST_DATA_PATH=$(basename $TEST_DATA_PATH)
# else
#     DATA_FOLDER=/opt/tiger/llava-video/preprocess_dataset
#     mkdir -p $DATA_FOLDER
#     hdfs dfs get $TEST_DATA_PATH $DATA_FOLDER/$(basename $TEST_DATA_PATH)
#     TEST_DATA_PATH=$(basename $TEST_DATA_PATH)
# fi

# RUN_TEST=True
# TEST_OUTPUT_DIR=output/test/$TEST_ID

# # SAVE_DIR=${PROJECT_ROOT}/output
# SAVE_DIR=output

# VIDEO_ENC_MODEL=/opt/tiger/llava-video/models/$(basename "$(dirname $VIDEO_ENCODER)")/$(basename $VIDEO_ENCODER)
# # mkdir -p $(dirname "$VIDEO_ENC_MODEL")
# # hdfs dfs get $VIDEO_ENCODER $(dirname "$VIDEO_ENC_MODEL")
# mkdir -p $VIDEO_ENC_MODEL
# hdfs dfs get $VIDEO_ENCODER/model.safetensors $VIDEO_ENC_MODEL/model.safetensors
# hdfs dfs get $VIDEO_ENCODER/config.json $VIDEO_ENC_MODEL/config.json

# if [[ $MODEL_ID == *"checkpoint-"* ]]; then
#     if [ -e $MODEL_ID ]; then
#         MODEL=$MODEL_ID
#     else
#         MODEL=$SAVE_DIR/$(basename "$(dirname $MODEL_ID)")/$(basename $MODEL_ID)
#         mkdir -p $(dirname "$MODEL")
#         hdfs dfs get $MODEL_ID $(dirname "$MODEL")
#     fi
# else
#     if [ -e $MODEL_ID ]; then
#         MODEL=$MODEL_ID
#     else
#         mkdir -p $SAVE_DIR
#         hdfs dfs get $MODEL_ID $SAVE_DIR/
#         MODEL=$SAVE_DIR/$(basename $MODEL_ID)
#     fi
# fi

# if [[ $MODEL_BASE == "hdfs"* ]]; then
#     hdfs dfs get $MODEL_BASE $SAVE_DIR/
#     MODEL_BASE=$SAVE_DIR/$(basename $MODEL_BASE)
# fi

# if [[ $PRETRAIN_WEIGHT == "hdfs"* ]]; then
#     hdfs dfs get $PRETRAIN_WEIGHT $SAVE_DIR/
#     PRETRAIN_WEIGHT=$SAVE_DIR/$(basename $PRETRAIN_WEIGHT)
# fi

# if [ -e $CKPT ]; then
#     echo "CKPT: $CKPT"
# else
#     if [ $LOAD_FROM_LORA == "True" ]; then
#         CKPT_PATH=$SAVE_DIR
#         if [ -e $CKPT_PATH/$(basename "$(dirname $CKPT)") ]; then
#             rm -rf $CKPT_PATH/$(basename "$(dirname $CKPT)")
#         fi
#         mkdir -p "$CKPT_PATH"
#         hdfs dfs get -f $(dirname "$CKPT") $CKPT_PATH
#         CKPT=$CKPT_PATH/$(basename "$(dirname $CKPT)")/$(basename $CKPT)
#         echo "LoRA CKPT: $CKPT"
#     else
#         CKPT_PATH=$SAVE_DIR/$(basename "$(dirname $CKPT)")/$(basename $CKPT)
#         mkdir -p $(dirname "$CKPT_PATH")
#         hdfs dfs get $CKPT $(dirname "$CKPT_PATH")
#         CKPT=$CKPT_PATH
#         echo "CKPT: $CKPT"
#     fi
# fi

# MODEL_MAX_LENGTH=1000000
# VISION_ENCODER=google/siglip-so400m-patch14-384
# # PROJECTOR=/mnt/bn/tiktok-mm-2/aiic/public/model/llava_series/projector/llavanext-Qwen_Qwen1.5-7B-Chat-google_siglip-so400m-patch14-384-mlp2x_gelu-pretrain_blip558k_plain/mm_projector.bin

# FRAMES_UPBOUND=30 # 32
# POOLING_STYLE=max
# POOLING_STRIDE=2
# NEW_LINE_POSITION=grid
# IMAGE_ASPECT_RATION=anyres

# # SAVE_MODEL_NAME=llava-v1_6-qwen_7b_tos_lora_ytb60Cap0-62kSpeakFiltBadAsr_geminiGPT4oAsrAac_ctn35k_240903

# WHISPER_PATH=openai/whisper-large-v3
# # BEATS_PATH=/mnt/bn/tiktok-mm-2/aiic/public/model/BEATs/BEATs_iter3_plus_AS2M_finetuned_on_AS2M_cpt2.pt
# # SALMONN_PATH=/mnt/bn/tiktok-mm-2/aiic/public/model/salmonn-v1.5-7b/checkpoint_23.pth
# FREEZE_SPEECH_QFORMER=False # True #
# SECOND_PER_WINDOW=0.2 #
# SECOND_STRIDE=0.2 #
# USE_FINAL_LINEAR=True
# FREEZE_FINAL_LINEAR=False # True

# RANDOM_VIDEO=False
# FREEZE_MM_MLP_ADAPTER=False # True
# SAVE_TORCH_CKPT=False # True
# # TRAIN_LLM_LAYERS="(0,1,2)"

# EVAL_STEPS=$SAVE_STEPS

# # CONFIG wandb
# # export WANDB_OFFICIAL=1
# WANDB_API_KEY=95a2fb46f543a792f66cb9207896e54eb84a5442
# wandb login $WANDB_API_KEY
# export WANDB_PROJECT=llava-video-thu # llava-video-ours
# export WANDB_NAME=$SAVE_MODEL_NAME
# wandb online

# # export CUDA_VISIBLE_DEVICES="6"

# # --lora_enable True --lora_r 128 --lora_alpha 256 --mm_projector_lr 2e-5 \
# # SigLIP grid: 384
# # [(384, 768), (768, 384), (768, 768), (1152, 384), (384, 1152)]
# # CLIP grid: 336
# # [(336, 672), (672, 336), (672, 672), (1008, 336), (336, 1008)]

# # Training ENV
# echo "Number of Node: ${ARNOLD_WORKER_NUM}"
# echo "GPT per Node: ${ARNOLD_WORKER_GPU}"

# if [ -e "/mnt/bn/tiktok-mm-2/aiic/public/model/huggingface" ]; then
#     export HF_HOME="/mnt/bn/tiktok-mm-2/aiic/public/model/huggingface"
# else
#     hdfs dfs get hdfs://harunava/home/byte_data_seed_azureb_tteng/user/tangchangli/huggingface /home/tiger/.cache/
# fi

# # huggingface-cli download $VISION_ENCODER
# # huggingface-cli download $WHISPER_PATH

# # export CUDA_VISIBLE_DEVICES="1,2,3,4,5,6,7"
# # torchrun --nproc_per_node=1 --master_port=19998 \

# git config --global --add safe.directory $PROJECT_ROOT

# # ${ARNOLD_WORKER_GPU}
# # torchrun --nproc_per_node=${ARNOLD_WORKER_GPU} --nnodes="${ARNOLD_WORKER_NUM}" --node_rank="${ARNOLD_ID}" --master_addr="${METIS_WORKER_0_HOST}" --master_port=12346 \
# torchrun --nproc_per_node=1 --master_port=19998 \
#     inference.py \
#         --deepspeed ./scripts/zero2.json \
#         --max_time $MAX_TIME \
#         --load_from_lora $LOAD_FROM_LORA \
#         --save_lora_only False \
#         --val_ratio 0 \
#         --eval_steps $EVAL_STEPS \
#         --lora_enable $LORA_ENABLE --lora_r $LORA_R --lora_alpha $LORA_ALPHA --lora_dropout $LORA_DROPOUT --mm_projector_lr 2e-5 \
#         --use_audio True \
#         --audio_visual True \
#         --whisper_path $WHISPER_PATH \
#         --audio_processor $WHISPER_PATH \
#         --freeze_speech_QFormer $FREEZE_SPEECH_QFORMER \
#         --use_final_linear $USE_FINAL_LINEAR \
#         --freeze_final_linear $FREEZE_FINAL_LINEAR \
#         --second_per_window $SECOND_PER_WINDOW \
#         --second_stride $SECOND_STRIDE \
#         --random_video $RANDOM_VIDEO \
#         --freeze_mm_mlp_adapter $FREEZE_MM_MLP_ADAPTER \
#         --model_name_or_path $MODEL_BASE \
#         --version qwen_1_5 \
#         --data_path $DATA_FOLDER/$TEST_DATA_PATH \
#         --test_data_path $DATA_FOLDER/$TEST_DATA_PATH \
#         --image_folder ${IMAGE_FOLDER} \
#         --video_folder ${VIDEO_FOLDER} \
#         --vision_tower ${VISION_ENCODER} \
#         --image_processor ${VISION_ENCODER} \
#         --mm_projector_type mlp2x_gelu \
#         --mm_vision_select_layer -2 \
#         --mm_use_im_start_end False \
#         --mm_use_im_patch_token False \
#         --frames_upbound ${FRAMES_UPBOUND} \
#         --video_fps $FPS \
#         --group_by_modality_length True \
#         --bf16 True \
#         --output_dir ${SAVE_DIR}/${SAVE_MODEL_NAME} \
#         --num_train_epochs $EPOCHS \
#         --per_device_train_batch_size $TRAIN_BS \
#         --per_device_eval_batch_size 1 \
#         --gradient_accumulation_steps $ACCUM_STEPS \
#         --evaluation_strategy "no" \
#         --save_strategy "steps" \
#         --save_steps $SAVE_STEPS \
#         --val_path $DATA_FOLDER/$(basename $VAL_DATA) \
#         --save_total_limit 100 \
#         --learning_rate $LR \
#         --weight_decay 0. \
#         --warmup_ratio 0.03 \
#         --lr_scheduler_type "cosine" \
#         --logging_steps 1 \
#         --tf32 True \
#         --model_max_length ${MODEL_MAX_LENGTH} \
#         --gradient_checkpointing True \
#         --mm_resampler_type "spatial_pool" \
#         --mm_spatial_pool_mode ${POOLING_STYLE} \
#         --mm_spatial_pool_stride ${POOLING_STRIDE} \
#         --mm_spatial_pool_out_channels 1152 \
#         --image_aspect_ratio ${IMAGE_ASPECT_RATION} \
#         --image_grid_pinpoints "[(384, 768), (768, 384), (768, 768), (1152, 384), (384, 1152)]" \
#         --mm_patch_merge_type spatial_unpad \
#         --mm_newline_position ${NEW_LINE_POSITION} \
#         --freeze_backbone $FREEZE_BACKBONE \
#         --save_torch_ckpt $SAVE_TORCH_CKPT \
#         --dataloader_num_workers 16 \
#         --disable_tqdm False \
#         --use_tos False \
#         --lora_llm_only $LORA_LLM_ONLY \
#         --whisper_lora $WHISPER_LORA \
#         --flash_attn $FLASH_ATTN \
#         --unfreeze_mm_vision_tower $UNFREEZE_MM_VISION_TOWER \
#         --run_test $RUN_TEST \
#         --test_output_dir $TEST_OUTPUT_DIR \
#         --prediction_loss_only $PREDICTION_LOSS_ONLY \
#         --ckpt $CKPT \
#         --multi_frame_projector $MULTI_FRAME_PROJECTOR \
#         --multi_frame_num $MULTI_FRAME_NUM \
#         --add_time_token $ADD_TIME_TOKEN \
#         --insert_time_precision $INSERT_TIME_PRECISION \
#         --max_new_tokens $MAX_NEW_TOKENS \
#         --use_mfcnn $USE_MFCNN \
#         --use_mftrans $USE_MFTRANS \
#         --use_flash_tower $USE_FLASH_TOWER \
#         --include_time_prompt $INCLUDE_TIME_PROMPT \
#         --merge_and_reload $MERGE_AND_RELOAD \
#         --do_reasoning $DO_REASONING \
#         --beam $BEAM \
#         --rollout $ROLLOUT \
#         --ddp_timeout 16000 \
#         --contrastive_adaptive $CONTRASTIVE \
#         --interp_factor $INTERP_FACTOR \
#         --do_sample $DO_SAMPLE \
#         --use_dora $USE_DORA \
#         --mm_pooling_position $MM_POOLING_POSITION \
#         --model_base $MODEL_BASE;
import random
import streamlit as st

# 1. 화면 상단에 멋진 제목과 안내 문구 배치
st.title("🎮 두근두근! 컴퓨터와 가위바위보 대결")
st.write("아래 버튼 중 하나를 선택해 컴퓨터를 이겨보세요! 승부 결과가 바로 공개됩니다.")
st.divider()

# 2. [✌️ 가위], [✊ 바위], [✋ 보] 버튼 3개 나란히 배치
col1, col2, col3 = st.columns(3)

user_choice = None
if col1.button("✌️ 가위", use_container_width=True):
  user_choice = "가위"
if col2.button("✊ 바위", use_container_width=True):
  user_choice = "바위"
if col3.button("✋ 보", use_container_width=True):
  user_choice = "보"

# 3. 버튼 클릭 시 컴퓨터 선택 및 대결 결과 출력
if user_choice:
  choices = ["가위", "바위", "보"]
  emoji = {"가위": "✌️", "바위": "✊", "보": "✋"}

  # 컴퓨터의 무작위 선택
  com_choice = random.choice(choices)

  st.divider()
  st.subheader(
      f"나: {emoji[user_choice]} {user_choice}  VS  컴퓨터:"
      f" {emoji[com_choice]} {com_choice}"
  )

  # 4. 승/패/무승부 판정 및 색깔 상자 + 축하 효과 출력
  if user_choice == com_choice:
    st.warning("🤝 무승부입니다! 아쉽네요, 한 번 더 도전해 보세요.")
  elif (
      (user_choice == "가위" and com_choice == "보")
      or (user_choice == "바위" and com_choice == "가위")
      or (user_choice == "보" and com_choice == "바위")
  ):
    st.success("🎉 승리했습니다! 축하합니다!")
    st.balloons()
  else:
    st.error("😭 패배했습니다... 컴퓨터가 한 수 위였네요!")

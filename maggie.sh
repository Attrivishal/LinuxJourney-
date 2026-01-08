#!/bin/bash

# ============================================
# MAKING MAGGI WITH TRAP (REAL LIFE EXAMPLE)
# ============================================

echo "🎬 STARTING: Making Maggi noodles..."

# ============================================
# STEP 1: SET UP EMERGENCY PLANS (TRAPS)
# ============================================

# EMERGENCY 1: Someone calls you while cooking
# (Like when you press CTRL+C)
trap "echo '⚠️  PHONE RINGING! Putting Maggi on low flame...'" SIGINT

# EMERGENCY 2: Fire alarm goes off
# (Like when script gets terminated)
trap "echo '🚨 FIRE ALARM! Turning off gas immediately!' && \
      echo '🚒 Emergency shutdown! Maggi might be ruined!' && exit" SIGTERM

# EMERGENCY 3: When you finish cooking (normal or interrupted)
# ALWAYS clean up the kitchen!
trap "echo '🧹 CLEANING UP: Washing pan, putting masala back...'" EXIT

# ============================================
# STEP 2: ACTUAL MAGGI MAKING PROCESS
# ============================================

echo "1. 🔥 Turning on gas..."
sleep 2

echo "2. 🍳 Putting water to boil..."i
sleep 3

echo "3. 📦 Opening Maggi packet..."
sleep 1

echo "4. 🍜 Adding noodles to boiling water..."
sleep 4

echo "5. 🧂 Adding taste maker..."
sleep 2

echo "6. ⏳ Waiting for 2 minutes..."
echo "   [IMPORTANT: Try pressing CTRL+C NOW to simulate phone call!]"

# Countdown with message
for i in {120..1}; do
    if [ $(($i % 30)) -eq 0 ]; then
        echo "   ⏰ $i seconds remaining..."
    fi
    sleep 1
done

echo "7. ✅ Maggi is ready!"
echo "8. 🍽️  Serving in bowl..."
sleep 2

# ============================================
# STEP 3: ENJOY!
# ============================================

echo "🎉 ENJOY YOUR MAGGIE! 🍜"
echo "The kitchen will be cleaned up automatically!"

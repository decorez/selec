import '../models/exercise.dart';

const List<String> muscleGroups = [
  'Chest',
  'Back',
  'Legs',
  'Shoulders',
  'Arms',
];

const List<Exercise> dummyExercises = [
  Exercise(
    id: 'bench-press',
    name: 'Bench Press',
    muscleGroup: 'Chest',
    equipment: 'Barbell',
    instructions:
        'Lie on the bench, lower the barbell to your chest, then press it up until your arms are straight.',
  ),
  Exercise(
    id: 'incline-db-press',
    name: 'Incline Dumbbell Press',
    muscleGroup: 'Chest',
    equipment: 'Dumbbell',
    instructions:
        'Set the bench to a 30-45 degree incline and press the dumbbells up with controlled movement.',
  ),
  Exercise(
    id: 'pull-up',
    name: 'Pull Up',
    muscleGroup: 'Back',
    equipment: 'Bodyweight',
    instructions:
        'Hang from the bar, pull yourself up until your chin passes the bar, then lower slowly.',
  ),
  Exercise(
    id: 'barbell-row',
    name: 'Barbell Row',
    muscleGroup: 'Back',
    equipment: 'Barbell',
    instructions:
        'Hinge forward with a straight back and pull the barbell toward your stomach.',
  ),
  Exercise(
    id: 'squat',
    name: 'Squat',
    muscleGroup: 'Legs',
    equipment: 'Barbell',
    instructions:
        'With the barbell on your upper back, lower your hips until your thighs are parallel to the floor, then stand up.',
  ),
  Exercise(
    id: 'leg-press',
    name: 'Leg Press',
    muscleGroup: 'Legs',
    equipment: 'Machine',
    instructions:
        'Push the platform with both feet until your legs are almost straight, then return with control.',
  ),
  Exercise(
    id: 'overhead-press',
    name: 'Overhead Press',
    muscleGroup: 'Shoulders',
    equipment: 'Barbell',
    instructions:
        'Press the barbell from your shoulders overhead until your arms are straight, then lower it back.',
  ),
  Exercise(
    id: 'bicep-curl',
    name: 'Bicep Curl',
    muscleGroup: 'Arms',
    equipment: 'Dumbbell',
    instructions:
        'Bend your elbows to curl the dumbbells toward your shoulders without swinging your body.',
  ),
];